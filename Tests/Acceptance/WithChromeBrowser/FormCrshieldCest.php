<?php

namespace Tests\Acceptance;

/**
 * Test suite executed in chrome webbrowser with JavaScript enabled. All form tests respect the default
 * delay of 3 seconds.
 */
class FormCrshieldCest
{
    private const TIMEOUT = 10;

    public function rootPageIsShown(\AcceptanceTester $I): void
    {
        $I->amOnPage('/');
        $I->see('Root Page');
    }

    public function simpleFormCanNotBeSubmittedIfDefaultDelayNotPassed(\AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form');
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->see('Step');
        $I->dontSee('SUCCESS');
    }

    public function simpleFormCanBeSubmitted(\AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    public function simpleFormWithSummaryCanBeSubmitted(\AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form-with-summary');
        $I->fillField(['id' => 'simpleformwithsummary-2-text-1'], 'test');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Next step');
        $I->waitForText('Summary step', self::TIMEOUT);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    public function multipleStepFormCanBeSubmitted(\AcceptanceTester $I): void
    {
        $I->amOnPage('multiple-step-form');
        $I->fillField(['id' => 'multiplestepform-3-text-1'], 'test');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Next step');
        $I->waitForElement('#multiplestepform-3-text-2', self::TIMEOUT);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    public function multipleStepFormWithSummaryCanBeSubmitted(\AcceptanceTester $I): void
    {
        $I->amOnPage('multiple-step-form-with-summary');
        $I->fillField(['id' => 'multiplestepformwithsummary-4-text-1'], 'test');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Next step');
        $I->waitForElement('#multiplestepformwithsummary-4-text-2', self::TIMEOUT);
        $this->clickAndWaitForPageLoad($I, 'Next step');
        $I->waitForText('Summary step', self::TIMEOUT);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    public function serverSideValidationCanBeSubmittedWithValidValues(\AcceptanceTester $I): void
    {
        $I->amOnPage('server-side-validation');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    public function serverSideValidationSubmitWithEmptyValuesThenResubmit(\AcceptanceTester $I): void
    {
        $I->amOnPage('server-side-validation');
        $this->waitForCalculatedResponse($I);
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('This field is mandatory.', self::TIMEOUT);
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $this->clickAndWaitForPageLoad($I, 'Submit');
        $I->waitForText('SUCCESS', self::TIMEOUT);
    }

    /**
     * Waits until FormCrShield.js has set the response including the nonce
     */
    private function waitForCalculatedResponse(\AcceptanceTester $I): void
    {
        $I->waitForJS(
            'const field = document.querySelector(\'[id$="-cr-field"]\');'
            . 'return field !== null && atob(field.value).split("|")[3]?.length === 64;',
            self::TIMEOUT
        );
    }

    private function clickAndWaitForPageLoad(\AcceptanceTester $I, string $buttonText): void
    {
        $button = ['xpath' => '//button[normalize-space()="' . $buttonText . '"]'];
        $I->waitForElementClickable($button, self::TIMEOUT);
        $I->executeJS('window.crshieldPageMarker = true;');
        $I->click($button);
        $I->waitForJS(
            'return window.crshieldPageMarker === undefined && document.readyState === "complete";',
            self::TIMEOUT
        );
    }
}
