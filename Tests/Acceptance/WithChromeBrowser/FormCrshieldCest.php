<?php

namespace Tests\Acceptance;

use AcceptanceTester;

/**
 * Test suite executed in chrome webbrowser with JavaScript enabled. All form tests respect the default
 * delay of 3 seconds.
 */
class FormCrshieldCest
{
    public function rootPageIsShown(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Root Page');
    }

    public function simpleFormCanNotBeSubmittedIfDefaultDelayNotPassed(AcceptanceTester $I)
    {
        $I->amOnPage('simple-form');
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function simpleFormCanBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('simple-form');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $I->click('Submit');
        $I->see('SUCCESS');
    }

    public function simpleFormWithSummaryCanBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('simple-form-with-summary');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'simpleformwithsummary-2-text-1'], 'test');
        $I->click('Next step');
        $I->see('Summary step');
        $I->click('Submit');
        $I->see('SUCCESS');
    }

    public function multipleStepFormCanBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('multiple-step-form');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepform-3-text-1'], 'test');
        $I->click('Next step');
        $I->click('Submit');
        $I->see('SUCCESS');
    }

    public function multipleStepFormWithSummaryCanBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('multiple-step-form-with-summary');
        $I->wait(4);
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepformwithsummary-4-text-1'], 'test');
        $I->click('Next step');
        $I->see('Step');
        $I->click('Next step');
        $I->see('Summary step');
        $I->click('Submit');
        $I->see('SUCCESS');
    }
}
