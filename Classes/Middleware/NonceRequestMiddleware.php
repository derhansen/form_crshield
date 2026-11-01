<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\Middleware;

use Derhansen\FormCrshield\Service\ChallengeResponseService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use TYPO3\CMS\Core\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Http\JsonResponse;
use TYPO3\CMS\Core\RateLimiter\RateLimiterFactory;

/**
 * Uncached endpoint (route: /form-crshield/nonce) which issues a single-use nonce for the challenge/response
 * spam shield. The nonce can not be part of the (cacheable) form output, since a cached nonce would be shared
 * by all visitors and invalidated after the first submission.
 *
 * The endpoint is rate limited per client IP to prevent abuse. Note that the endpoint is not a spam vector on
 * its own: to get a submission accepted, a client still needs a valid page-bound challenge response AND a
 * single-use nonce. Handing out nonces does not help a client that can not solve the page challenge.
 */
final class NonceRequestMiddleware implements MiddlewareInterface
{
    public const ROUTE_PATH = '/form-crshield/nonce';
    private const DEFAULT_NONCE_LIFETIME = 3600;
    private const MIN_NONCE_LIFETIME = 60;

    public function __construct(
        private readonly ChallengeResponseService $challengeResponseService,
        private readonly Context $context,
        private readonly RateLimiterFactory $rateLimiterFactory,
        private readonly ExtensionConfiguration $extensionConfiguration,
    ) {}

    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {
        $path = rtrim($request->getUri()->getPath(), '/');
        if ($path !== self::ROUTE_PATH && !str_ends_with($path, self::ROUTE_PATH)) {
            return $handler->handle($request);
        }

        $limiter = $this->rateLimiterFactory->createRequestBasedLimiter($request, [
            'id' => 'form-crshield-nonce',
            'policy' => 'sliding_window',
            'limit' => 60,
            'interval' => '1 minute',
        ]);
        $rateLimit = $limiter->consume();
        if (!$rateLimit->isAccepted()) {
            $retryAfter = max(0, $rateLimit->getRetryAfter()->getTimestamp() - $this->getCurrentTimestamp());
            return (new JsonResponse(['error' => 'Too many requests'], 429))
                ->withHeader('Retry-After', (string)$retryAfter)
                ->withHeader('Cache-Control', 'no-store, no-cache, must-revalidate, private');
        }

        $nonce = $this->challengeResponseService->createNonce($this->getNonceLifetime());

        return (new JsonResponse(['nonce' => $nonce]))
            ->withHeader('Cache-Control', 'no-store, no-cache, must-revalidate, private')
            ->withHeader('Pragma', 'no-cache');
    }

    private function getNonceLifetime(): int
    {
        $settings = $this->extensionConfiguration->get('form_crshield');
        $lifetime = (int)($settings['nonceLifetime'] ?? self::DEFAULT_NONCE_LIFETIME);
        return max(self::MIN_NONCE_LIFETIME, $lifetime);
    }

    private function getCurrentTimestamp(): int
    {
        return (int)$this->context->getPropertyFromAspect('date', 'timestamp');
    }
}
