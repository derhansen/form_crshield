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

    public function getChallenge(int $expirationTime, int $delay, string $salt): string
    {
        return $expirationTime . '|' . $this->hashService->hmac((string)$expirationTime, $salt) . '|' . $delay;
    }

    public function isValidResponse(string $submittedResponse, string $salt): bool
    {
        $submittedResponse = base64_decode($submittedResponse);
        if (!str_contains($submittedResponse, '|')) {
            $this->logger->debug('CR response invalid. Submitted response', [$submittedResponse]);
            return false;
        }

        [$expirationTime, $clientData] = explode('|', $submittedResponse);
        $knownHmac = $this->hashService->hmac($expirationTime, $salt);
        $calculatedData = str_rot13($knownHmac);

        if ($calculatedData !== $clientData) {
            $this->logger->debug('CR response missmatch. Submitted response', [$submittedResponse]);
            return false;
        }

        $currentTimestamp = $this->context->getPropertyFromAspect('date', 'timestamp');
        if ((int)($expirationTime) <= $currentTimestamp) {
            $this->logger->debug('CR response expired. Submitted response', [$submittedResponse]);
            return false;
        }

        return true;
    }
}
