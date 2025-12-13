<?php

namespace Tests\Acceptance;

use AcceptanceTester;

/**
 * Test suite executed in chrome webbrowser with JavaScript enabled. All form tests respect the default
 * delay of 3 seconds.
 */
class FormCrshieldCest
{
    public function rootPageIsShown(AcceptanceTester $I): void
    {
        $I->amOnPage('/');
        $I->see('Root Page');
    }

    public function simpleFormCanNotBeSubmittedIfDefaultDelayNotPassed(AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form');
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function simpleFormCanBeSubmitted(AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }

    public function simpleFormWithSummaryCanBeSubmitted(AcceptanceTester $I): void
    {
        $I->amOnPage('simple-form-with-summary');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'simpleformwithsummary-2-text-1'], 'test');
        $I->click('Next step');
        $I->see('Summary step');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }

    public function multipleStepFormCanBeSubmitted(AcceptanceTester $I): void
    {
        $I->amOnPage('multiple-step-form');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepform-3-text-1'], 'test');
        $I->click('Next step');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }

    public function multipleStepFormWithSummaryCanBeSubmitted(AcceptanceTester $I): void
    {
        $I->amOnPage('multiple-step-form-with-summary');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepformwithsummary-4-text-1'], 'test');
        $I->click('Next step');
        $I->waitForText('Step', 5);
        $I->click('Next step');
        $I->see('Summary step');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }

    public function serverSideValidationCanBeSubmittedWithValidValues(AcceptanceTester $I): void
    {
        $I->amOnPage('server-side-validation');
        $I->wait(4);
        $I->see('Step');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }

    public function serverSideValidationSubmitWithEmptyValuesThenResubmit(AcceptanceTester $I): void
    {
        $I->amOnPage('server-side-validation');
        $I->wait(4);
        $I->see('Step');
        $I->click('Submit');
        $I->see('This field is mandatory. ');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $I->waitForText('Submit', 5);
        $I->click('Submit');
        $I->waitForText('SUCCESS', 5);
    }
}
