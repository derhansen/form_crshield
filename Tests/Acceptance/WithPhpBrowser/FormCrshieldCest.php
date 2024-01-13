<?php

namespace Tests\Acceptance;

use AcceptanceTester;

/**
 * Test suite executed in php browser which does not support JavaScript.
 */
class FormCrshieldCest
{
    public function rootPageIsShown(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Root Page');
    }

    public function simpleFormCanNotBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('simple-form');
        $I->see('Step');
        $I->fillField(['id' => 'simpleform-1-text-1'], 'test');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function simpleFormWithSummaryCanNotBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('simple-form-with-summary');
        $I->see('Step');
        $I->fillField(['id' => 'simpleformwithsummary-2-text-1'], 'test');
        $I->click('Next step');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function multipleStepFormCanNotBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('multiple-step-form');
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepform-3-text-1'], 'test');
        $I->click('Next step');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function multipleStepFormWithSummaryCanNotBeSubmitted(AcceptanceTester $I)
    {
        $I->amOnPage('multiple-step-form-with-summary');
        $I->see('Step');
        $I->fillField(['id' => 'multiplestepformwithsummary-4-text-1'], 'test');
        $I->click('Next step');
        $I->see('Step');
        $I->click('Next step');
        $I->see('Summary step');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function serverSideValidationCanBeSubmittedWithValidValues(AcceptanceTester $I)
    {
        $I->amOnPage('server-side-validation');
        $I->see('Step');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }

    public function serverSideValidationSubmitWithEmptyValuesThenResubmit(AcceptanceTester $I)
    {
        $I->amOnPage('server-side-validation');
        $I->see('Step');
        $I->click('Submit');
        $I->see('This field is mandatory. ');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-0');
        $I->checkOption('#serverSideValidation-6-multicheckbox-1-1');
        $I->click('Submit');
        $I->dontSee('SUCCESS');
    }
}
