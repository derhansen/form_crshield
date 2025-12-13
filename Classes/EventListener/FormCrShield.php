<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\EventListener;

use Derhansen\FormCrshield\Service\ChallengeResponseService;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\Attribute\AsEventListener;
use TYPO3\CMS\Core\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Http\ApplicationType;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Validation\Validator\NotEmptyValidator;
use TYPO3\CMS\Form\Domain\Model\FormElements\Page;
use TYPO3\CMS\Form\Domain\Runtime\FormRuntime;
use TYPO3\CMS\Form\Event\AfterCurrentPageIsResolvedEvent;
use TYPO3\CMS\Form\Event\BeforeRenderableIsValidatedEvent;
use TYPO3\CMS\Frontend\Cache\CacheLifetimeCalculator;
use TYPO3\CMS\Frontend\Page\PageInformation;

class FormCrShield
{
    private const FIELD_ID = 'cr-field';

    private int $currentTimestamp;
    private array $settings;

    public function __construct(
        private readonly LoggerInterface $logger,
        private readonly Context $context,
        private readonly ChallengeResponseService $challengeResponseService
    ) {
        $this->currentTimestamp = $this->context->getPropertyFromAspect('date', 'timestamp');
        $this->settings = GeneralUtility::makeInstance(ExtensionConfiguration::class)->get('form_crshield');
    }

    #[AsEventListener('derhansen/form_crshield/form/after-initialize-current-page')]
    public function afterInitializeCurrentPage(AfterCurrentPageIsResolvedEvent $event): void
    {
        // If the form is in preview mode or we are in backend context, do not add the cr-field
        if (($event->formRuntime->getFormDefinition()->getRenderingOptions()['previewMode'] ?? false) ||
            ApplicationType::fromRequest($event->request)->isBackend()
        ) {
            return;
        }

        $pageObject = $event->currentPage ?? $event->lastDisplayedPage;

        if ($pageObject && !$this->crFieldHasBeenVerified($event->formRuntime)) {
            // Set delay for initial form (no delay for re-submission of form)
            $delay = $event->formRuntime->getFormSession() === null ? (int)($this->settings['crJavaScriptDelay'] ?? 3) : 0;
            $challenge = $this->challengeResponseService->getChallenge(
                (string)($this->settings['obfuscationMethod'] ?? '1'),
                $this->getPageExpirationTime($event->formRuntime),
                $delay,
                $this->getHmacSalt($event->formRuntime)
            );

            $newElement = $pageObject->createElement(self::FIELD_ID, 'Hidden');
            $newElement->addValidator(new NotEmptyValidator());
            $newElement->setDefaultValue(base64_encode($challenge));
            $newElement->setProperty('fluidAdditionalAttributes', ['autocomplete' => 'off']);
        }
    }

    #[AsEventListener('derhansen/form_crshield/form/after-submit')]
    public function afterSubmit(BeforeRenderableIsValidatedEvent $event): void
    {
        $requestArguments = $event->request->getArguments();

        // Write all POST data for the current page to debug log
        if (is_a($event->renderable, Page::class)) {
            $this->logger->debug('Submitted data', $requestArguments);
        }

        if (!(is_a($event->renderable, Page::class) || $event->renderable->getIdentifier() === self::FIELD_ID)) {
            return;
        }

        $submittedResponse = $requestArguments[self::FIELD_ID] ?? '';
        if (!$this->challengeResponseService->isValidResponse($submittedResponse, $this->getHmacSalt($event->formRuntime))) {
            $this->logger->debug('CR response validation failed', $requestArguments);
            $event->value = '';
            return;
        }

        // Save sha1 of HmacSalt to formstate for cr-field
        $event->formRuntime->getFormState()?->setFormValue(self::FIELD_ID, sha1($this->getHmacSalt($event->formRuntime)));
    }

    protected function crFieldHasBeenVerified(FormRuntime $runtime): bool
    {
        return $runtime->getFormState()?->getFormValue(self::FIELD_ID) === sha1($this->getHmacSalt($runtime));
    }

    protected function getPageExpirationTime(FormRuntime $runtime): int
    {
        $pageRecord = $this->getPageRecord($runtime->getRequest());
        if ($pageRecord === []) {
            return 0;
        }

        $timeOutTime = $this->getCacheTimeout($runtime->getRequest());
        if ($timeOutTime < (int)($this->settings['minimumPageExpirationTime'] ?? 900)) {
            $timeOutTime += (int)($this->settings['additionalPageExpirationTime'] ?? 3600);
        }

        return $timeOutTime + $this->currentTimestamp;
    }

    /**
     * Get the cache timeout for the current page (taken 1:1 from TypoScriptFrontendController)
     */
    protected function getCacheTimeout(ServerRequestInterface $request): int
    {
        $pageInformation = $request->getAttribute('frontend.page.information');
        $typoScriptConfigArray = $request->getAttribute('frontend.typoscript')->getConfigArray();
        return GeneralUtility::makeInstance(CacheLifetimeCalculator::class)
            ->calculateLifetimeForPage(
                $pageInformation->getId(),
                $pageInformation->getPageRecord(),
                $typoScriptConfigArray,
                $this->context
            );
    }

    protected function getHmacSalt(FormRuntime $runtime): string
    {
        $pageRecord = $this->getPageRecord($runtime->getRequest());
        return $runtime->getIdentifier() . $pageRecord['crdate'] . '-' . $pageRecord['uid'];
    }

    protected function getPageRecord(ServerRequestInterface $request): array
    {
        /** @var PageInformation $pageInformation */
        $pageInformation = $request->getAttribute('frontend.page.information');
        return $pageInformation->getPageRecord();
    }
}
