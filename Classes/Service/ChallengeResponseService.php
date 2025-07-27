<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\Service;

use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Crypto\HashService;

class ChallengeResponseService
{
    public function __construct(
        protected readonly LoggerInterface $logger,
        protected readonly HashService $hashService,
        protected readonly Context $context
    ) {
    }

    public function getChallenge(string $method, int $expirationTime, int $delay, string $salt): string
    {
        return $method . '|' . $expirationTime . '|' . $this->hashService->hmac((string)$expirationTime, $salt) . '|' .
            $delay;
    }

    public function isValidResponse(string $submittedResponse, string $salt): bool
    {
        $submittedResponse = base64_decode($submittedResponse);
        if (!str_contains($submittedResponse, '|')) {
            $this->logger->debug(
                'CR response invalid. String does not contain a pipe char. Submitted response',
                [$submittedResponse]
            );
            return false;
        }

        if (substr_count($submittedResponse, '|') !== 2) {
            $this->logger->debug(
                'CR response invalid. String does not contain exactly 2 pipe chars. Submitted response',
                [$submittedResponse]
            );
            return false;
        }

        [$method, $expirationTime, $clientData] = explode('|', $submittedResponse);
        $knownHmac = $this->hashService->hmac($expirationTime, $salt);
        $calculatedData = $this->getCalculatedData($knownHmac, $method);

        if ($calculatedData !== $clientData) {
            $this->logger->debug('CR response missmatch. Submitted response', [$submittedResponse]);
            return false;
        }

        $currentTimestamp = $this->context->getPropertyFromAspect('date', 'timestamp');
        if ((int)($expirationTime) <= $currentTimestamp) {
            $this->logger->debug('CR response expired. Submitted response', [$submittedResponse]);
            return false;
        }

        $this->logger->debug('CR response successfully validated.', [$submittedResponse]);
        return true;
    }

    private function getCalculatedData(string $knownHmac, string $method): string
    {
        switch ($method) {
            case '2':
                $result = strrev($knownHmac);
                break;
            case '1':
            default:
                $result = str_rot13($knownHmac);
        }

        return $result;
    }
}