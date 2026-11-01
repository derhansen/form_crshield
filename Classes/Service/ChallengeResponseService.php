<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\Service;

use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\Cache\CacheManager;
use TYPO3\CMS\Core\Cache\Frontend\FrontendInterface;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Crypto\HashService;
use TYPO3\CMS\Core\Crypto\Random;

final class ChallengeResponseService
{
    protected readonly FrontendInterface $nonceCache;

    public function __construct(
        protected readonly LoggerInterface $logger,
        protected readonly HashService $hashService,
        protected readonly Context $context,
        protected readonly CacheManager $cacheManager,
        protected readonly Random $random
    ) {
        // The "cache.formcrshield" in instantiated manually here to provide backwards compatibility of the class
        $this->nonceCache = $cacheManager->getCache('formcrshield');
    }

    public function createNonce(int $lifetime): string
    {
        $nonce = $this->random->generateRandomHexString(64);
        $this->nonceCache->set($nonce, '', [], $lifetime);

        $this->logger->debug('Nonce created', ['nonce' => $nonce, 'lifetime' => $lifetime]);

        return $nonce;
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

        if (!$this->nonceCache->has($nonce)) {
            $this->logger->debug(
                'CR response nonce invalid, expired or already used.',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        // Invalidate the nonce, so it can not be reused for a subsequent (spam) submission
        $this->nonceCache->remove($nonce);
        $this->logger->debug('Nonce consumed', ['nonce' => $nonce]);

        $this->logger->debug(
            'CR response successfully validated.',
            ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
        );
        return true;
    }

    private function getCalculatedData(string $knownHmac, string $method): string
    {
        return match ($method) {
            '2' => strrev($knownHmac),
            default => str_rot13($knownHmac),
        };
    }
}
