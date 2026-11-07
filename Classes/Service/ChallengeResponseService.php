<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\Service;

use Psr\Log\LoggerInterface;
use Symfony\Component\DependencyInjection\Attribute\Autowire;
use TYPO3\CMS\Core\Cache\Frontend\FrontendInterface;
use TYPO3\CMS\Core\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Crypto\HashService;
use TYPO3\CMS\Core\Crypto\Random;

final class ChallengeResponseService
{
    private const DEFAULT_LIFETIME = 3600;
    private const MIN_LIFETIME = 60;
    private const TOKEN_PREFIX = 'v_';

    public function __construct(
        protected readonly LoggerInterface $logger,
        protected readonly HashService $hashService,
        protected readonly Context $context,
        protected readonly Random $random,
        protected readonly ExtensionConfiguration $extensionConfiguration,
        #[Autowire(service: 'cache.formcrshield')]
        protected readonly FrontendInterface $nonceCache
    ) {}

    public function createNonce(): string
    {
        $nonce = $this->random->generateRandomHexString(64);
        $this->nonceCache->set($nonce, '', [], $this->getLifetime());

        $this->logger->debug('Nonce created', ['nonce' => $nonce]);

        return $nonce;
    }

    public function createVerificationToken(string $salt): string
    {
        $token = $this->random->generateRandomHexString(64);
        $this->nonceCache->set(self::TOKEN_PREFIX . $token, sha1($salt), [], $this->getLifetime());

        $this->logger->debug('Verification token created', ['token' => $token]);

        return $token;
    }

    public function isValidVerificationToken(string $token, string $salt): bool
    {
        return $this->isValidHexString($token) && $this->nonceCache->get(self::TOKEN_PREFIX . $token) === sha1($salt);
    }

    /**
     * Invalidates the given token and returns a new one, or null if the given token is invalid
     */
    public function rotateVerificationToken(string $token, string $salt): ?string
    {
        if (!$this->isValidVerificationToken($token, $salt)) {
            return null;
        }

        if (!$this->nonceCache->remove(self::TOKEN_PREFIX . $token)) {
            return null;
        }
        $this->logger->debug('Verification token consumed', ['token' => $token]);

        return $this->createVerificationToken($salt);
    }

    public function getChallenge(string $method, int $expirationTime, int $delay, string $salt): string
    {
        $challenge = $method . '|' . $expirationTime . '|' . $this->hashService->hmac((string)$expirationTime, $salt) . '|' .
            $delay;

        $this->logger->debug(
            'Challenge generated using the following parameters: ',
            [
                'method' => $method,
                'expirationTime' => $expirationTime,
                'delay' => $delay,
                'salt' => $salt,
                'challenge' => $challenge,
            ]
        );

        return $challenge;
    }

    public function isValidResponse(string $submittedResponse, string $salt): bool
    {
        $decodedResponse = base64_decode($submittedResponse);
        if (substr_count($decodedResponse, '|') !== 3) {
            $this->logger->debug(
                'CR response invalid. String does not contain exactly 3 pipe chars. Submitted response',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        [$method, $expirationTime, $clientData, $nonce] = explode('|', $decodedResponse, 4);
        $knownHmac = $this->hashService->hmac($expirationTime, $salt);
        $calculatedData = $this->getCalculatedData($knownHmac, $method);

        if ($calculatedData !== $clientData) {
            $this->logger->debug(
                'CR response missmatch.',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        $currentTimestamp = $this->context->getPropertyFromAspect('date', 'timestamp');
        if ((int)($expirationTime) <= $currentTimestamp) {
            $this->logger->debug(
                'CR response expired. Submitted response',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        if (!$this->isValidHexString($nonce)
            || !$this->nonceCache->has($nonce)
            || !$this->nonceCache->remove($nonce)
        ) {
            $this->logger->debug(
                'CR response nonce invalid, expired or already used.',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        $this->logger->debug('Nonce consumed', ['nonce' => $nonce]);

        $this->logger->debug(
            'CR response successfully validated.',
            ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
        );
        return true;
    }

    private function getLifetime(): int
    {
        $settings = $this->extensionConfiguration->get('form_crshield');
        return max(self::MIN_LIFETIME, (int)($settings['nonceLifetime'] ?? self::DEFAULT_LIFETIME));
    }

    private function isValidHexString(string $value): bool
    {
        return preg_match('/^[a-f0-9]{64}$/', $value) === 1;
    }

    private function getCalculatedData(string $knownHmac, string $method): string
    {
        return match ($method) {
            '2' => strrev($knownHmac),
            default => str_rot13($knownHmac),
        };
    }
}
