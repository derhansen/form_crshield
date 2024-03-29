<?php

declare(strict_types=1);

namespace Derhansen\FormCrshield\Hooks;

use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use TYPO3\CMS\Core\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Http\ApplicationType;
use TYPO3\CMS\Core\Information\Typo3Version;
use TYPO3\CMS\Core\Log\LogManager;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Validation\Validator\NotEmptyValidator;
use TYPO3\CMS\Form\Domain\Model\FormElements\Page;
use TYPO3\CMS\Form\Domain\Runtime\FormRuntime;
use TYPO3\CMS\Frontend\Controller\TypoScriptFrontendController;

class Form
{
    const FIELD_ID = 'cr-field';

    /**
     * @var LoggerInterface
     */
    private $logger;

    /**
     * @var int
     */
    private $currentTimestamp;

    public function __construct()
    {
        $this->logger = GeneralUtility::makeInstance(LogManager::class)->getLogger(__CLASS__);
        $context = GeneralUtility::makeInstance(Context::class);
        $this->currentTimestamp = $context->getPropertyFromAspect('date', 'timestamp');
    }

    public function afterInitializeCurrentPage(FormRuntime $runtime, ?Page $currentPage, ?Page $page, array $args)
    {
        // If the form is in preview mode or we are in backend context, do not add the cr-field
        if (($runtime->getFormDefinition()->getRenderingOptions()['previewMode'] ?? false) ||
            ApplicationType::fromRequest($GLOBALS['TYPO3_REQUEST'])->isBackend()
        ) {
            return $currentPage;
        }

        $pageObject = $currentPage ?? $page;

        if ($pageObject && !$this->crFieldHasBeenVerified($runtime)) {
            $expirationTime = (string)$this->getPageExpirationTime($runtime);
            // Set delay for initial form (no delay for re-submission of form)
            $extensionSettings = GeneralUtility::makeInstance(ExtensionConfiguration::class)->get('form_crshield');
            $delay = $runtime->getFormSession() === null ? (int)($extensionSettings['crJavaScriptDelay'] ?? 3) : 0;
            $challenge = $expirationTime . '|' . GeneralUtility::hmac($expirationTime, $this->getHmacSalt($runtime)) . '|' . $delay;

            $newElement = $pageObject->createElement(self::FIELD_ID, 'Hidden');
            $newElement->addValidator(new NotEmptyValidator());
            $newElement->setDefaultValue(base64_encode($challenge));
            $newElement->setProperty('fluidAdditionalAttributes', ['autocomplete' => 'off']);
        }

        return $currentPage;
    }

    public function afterSubmit(FormRuntime $runtime, $element, $value, $requestArguments)
    {
        // Write all POST data for the current page to debug log
        if (is_a($element, Page::class)) {
            $this->logger->debug('Submitted data', $requestArguments);
        }

        if (!(is_a($element, Page::class) || $element->getIdentifier() === self::FIELD_ID)) {
            return $value;
        }

        $submittedResponse = base64_decode($requestArguments[self::FIELD_ID] ?? '');
        if (!str_contains($submittedResponse, '|')) {
            $this->logger->debug('CR response invalid. Submitted data', $requestArguments);
            return '';
        }

        [$expirationTime, $clientData] = explode('|', $submittedResponse);
        $knownHmac = GeneralUtility::hmac($expirationTime, $this->getHmacSalt($runtime));
        $calculatedData = str_rot13($knownHmac);

        if ($calculatedData !== $clientData) {
            $this->logger->debug('CR response missmatch. Submitted data', $requestArguments);
            return '';
        }

        if ((int)($expirationTime) <= $this->currentTimestamp) {
            $this->logger->debug('CR response expired. Submitted data', $requestArguments);
            return '';
        }

        // Save sha1 of HmacSalt to formstate for cr-field
        if ($runtime->getFormState()) {
            $runtime->getFormState()->setFormValue(self::FIELD_ID, sha1($this->getHmacSalt($runtime)));
        }

        return $value;
    }

    protected function crFieldHasBeenVerified(FormRuntime $runtime): bool
    {
        return $runtime->getFormState() &&
            $runtime->getFormState()->getFormValue(self::FIELD_ID) === sha1($this->getHmacSalt($runtime));
    }

    protected function getPageExpirationTime(FormRuntime $runtime): int
    {
        $tsfe = $this->getTsfe($this->getRequest($runtime));
        // TSFE to not contains a valid page record?!
        if (!$tsfe || !is_array($tsfe->page)) {
            return 0;
        }
        $timeOutTime = $tsfe->get_cache_timeout();

        // If page has a endtime before the current timeOutTime, use it instead:
        if ($tsfe->page['endtime']) {
            $endtimePage = (int)($tsfe->page['endtime']) - $this->currentTimestamp;
            if ($endtimePage && $endtimePage < $timeOutTime) {
                $timeOutTime = $endtimePage;
            }
        }

        $extensionSettings = GeneralUtility::makeInstance(ExtensionConfiguration::class)->get('form_crshield');
        if ($timeOutTime < (int)($extensionSettings['minimumPageExpirationTime'] ?? 900)) {
            $timeOutTime += (int)($extensionSettings['additionalPageExpirationTime'] ?? 3600);
        }

        return $timeOutTime + $this->currentTimestamp;
    }

    protected function getHmacSalt(FormRuntime $runtime): string
    {
        return $runtime->getIdentifier() . $this->getPageData($this->getTsfe($this->getRequest($runtime)));
    }

    protected function getPageData(?TypoScriptFrontendController $tsfe): string
    {
        return $tsfe ? $tsfe->page['crdate'] . '-' . $tsfe->page['uid'] : '0-0';
    }

    protected function getRequest(FormRuntime $formRuntime): ServerRequestInterface
    {
        return (new Typo3Version())->getMajorVersion() >= 11 ? $formRuntime->getRequest() : $GLOBALS['TYPO3_REQUEST'];
    }

    protected function getTsfe(ServerRequestInterface $request): ?TypoScriptFrontendController
    {
        return (new Typo3Version())->getMajorVersion() >= 11 ? $request->getAttribute('frontend.controller') : $GLOBALS['TSFE'];
    }
}
