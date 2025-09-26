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
        $decodedResponse = base64_decode($submittedResponse);
        if (!str_contains($decodedResponse, '|')) {
            $this->logger->debug(
                'CR response invalid. String does not contain a pipe char.',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        if (substr_count($decodedResponse, '|') !== 2) {
            $this->logger->debug(
                'CR response invalid. String does not contain exactly 2 pipe chars. Submitted response',
                ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
            );
            return false;
        }

        [$method, $expirationTime, $clientData] = explode('|', $decodedResponse);
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

        $this->logger->debug(
            'CR response successfully validated.',
            ['Submitted response: ' => $submittedResponse, 'Decoded response: ' => $decodedResponse]
        );
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