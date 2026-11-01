<?php

namespace Tests\Acceptance;

use PHPUnit\Framework\Assert;

/**
 * Simulates a client, which calculates the response without JavaScript.
 */
class NonceCest
{
    private const FORM = 'simpleform-1';

    public function nonceEndpointReturnsUncachedNonce(\AcceptanceTester $I): void
    {
        $I->amOnPage('/form-crshield/nonce');
        $I->seeResponseCodeIs(200);
        Assert::assertMatchesRegularExpression('/^[a-f0-9]{64}$/', $this->grabNonce($I));
        Assert::assertStringContainsString('no-store', implode(',', $I->grabResponseHeaders('Cache-Control')));
    }

    public function nonceEndpointRejectsCrossSiteRequest(\AcceptanceTester $I): void
    {
        $I->haveHttpHeader('Sec-Fetch-Site', 'cross-site');
        $I->amOnPage('/form-crshield/nonce');
        $I->seeResponseCodeIs(403);
    }

    public function nonceEndpointRejectsNavigationRequest(\AcceptanceTester $I): void
    {
        $I->haveHttpHeader('Sec-Fetch-Site', 'none');
        $I->haveHttpHeader('Sec-Fetch-Mode', 'navigate');
        $I->amOnPage('/form-crshield/nonce');
        $I->seeResponseCodeIs(403);
    }

    public function nonceEndpointAcceptsSameOriginFetchRequest(\AcceptanceTester $I): void
    {
        $I->haveHttpHeader('Sec-Fetch-Site', 'same-origin');
        $I->haveHttpHeader('Sec-Fetch-Mode', 'cors');
        $I->amOnPage('/form-crshield/nonce');
        $I->seeResponseCodeIs(200);
        Assert::assertMatchesRegularExpression('/^[a-f0-9]{64}$/', $this->grabNonce($I));
    }

    public function formCanBeSubmittedWithResponseAndNonce(\AcceptanceTester $I): void
    {
        $response = $this->getResponse($I, $this->fetchNonce($I));
        $this->submitForm($I, $response);
        $I->see('SUCCESS');
    }

    public function formWithSummaryCanBeSubmittedWithResponseAndNonce(\AcceptanceTester $I): void
    {
        $form = 'simpleformwithsummary-2';
        $response = $this->getResponse($I, $this->fetchNonce($I), '/simple-form-with-summary', $form);
        $this->submitForm($I, $response, $form);
        $I->see('Summary step');
        $I->click('Submit');
        $I->see('SUCCESS');
    }

    public function replayedResponseAndNonceIsRejected(\AcceptanceTester $I): void
    {
        $response = $this->getResponse($I, $this->fetchNonce($I));
        $this->submitForm($I, $response);
        $I->see('SUCCESS');

        $I->amOnPage('/simple-form');
        $this->submitForm($I, $response);
        $I->dontSee('SUCCESS');
    }

    public function replayedFormStateIsRejected(\AcceptanceTester $I): void
    {
        $response = $this->getResponse($I, $this->fetchNonce($I));
        $this->submitForm($I, $response, self::FORM, '');
        $I->see('This field is mandatory.');
        $fields = $this->grabStateFields($I, self::FORM);

        $this->submitForm($I, $response);
        $I->see('SUCCESS');

        $I->amOnPage('/simple-form');
        $this->submitFormWithFields($I, self::FORM, $fields + ['text-1' => 'test', 'cr-field' => '', '__currentPage' => '1']);
        $I->dontSee('SUCCESS');
    }

    public function replayedFormStateOfMultipleStepFormIsRejected(\AcceptanceTester $I): void
    {
        $form = 'multiplestepform-3';
        $response = $this->getResponse($I, $this->fetchNonce($I), '/multiple-step-form', $form);
        $this->submitForm($I, $response, $form);
        $I->see('Submit');
        $fields = $this->grabStateFields($I, $form);

        $I->click('Submit');
        $I->see('SUCCESS');

        $I->amOnPage('/multiple-step-form');
        $this->submitFormWithFields($I, $form, $fields + ['text-2' => 'test', 'cr-field' => '', '__currentPage' => '2']);
        $I->dontSee('SUCCESS');
    }

    public function responseWithoutNonceIsRejected(\AcceptanceTester $I): void
    {
        $response = $this->getResponse($I, null);
        $this->submitForm($I, $response);
        $I->dontSee('SUCCESS');
    }

    public function responseWithUnknownNonceIsRejected(\AcceptanceTester $I): void
    {
        $response = $this->getResponse($I, bin2hex(random_bytes(32)));
        $this->submitForm($I, $response);
        $I->dontSee('SUCCESS');
    }

    private function fetchNonce(\AcceptanceTester $I): string
    {
        $I->amOnPage('/form-crshield/nonce');
        return $this->grabNonce($I);
    }

    private function grabNonce(\AcceptanceTester $I): string
    {
        return (string)(json_decode($I->grabPageSource(), true)['nonce'] ?? '');
    }

    /**
     * Opens the form and calculates the response like FormCrShield.js does
     */
    private function getResponse(\AcceptanceTester $I, ?string $nonce, string $page = '/simple-form', string $form = self::FORM): string
    {
        $I->amOnPage($page);
        $I->see('Step');

        [$method, $expiration, $hmac] = explode('|', base64_decode($I->grabValueFrom('#' . $form . '-cr-field')));
        $result = $method === '2' ? strrev($hmac) : str_rot13($hmac);

        $parts = [$method, $expiration, $result];
        if ($nonce !== null) {
            $parts[] = $nonce;
        }
        return base64_encode(implode('|', $parts));
    }

    private function submitForm(\AcceptanceTester $I, string $response, string $form = self::FORM, string $text = 'test'): void
    {
        $I->submitForm(
            '#' . $form,
            [
                'tx_form_formframework' => [
                    $form => [
                        'text-1' => $text,
                        'cr-field' => $response,
                    ],
                ],
            ],
            'tx_form_formframework[' . $form . '][__currentPage]'
        );
    }

    private function submitFormWithFields(\AcceptanceTester $I, string $form, array $fields): void
    {
        $I->submitForm('#' . $form, ['tx_form_formframework' => [$form => $fields]]);
    }

    private function grabStateFields(\AcceptanceTester $I, string $form): array
    {
        $fields = [];
        foreach (['__state', '__session'] as $field) {
            $fields[$field] = $I->grabValueFrom('input[name="tx_form_formframework[' . $form . '][' . $field . ']"]');
        }
        return $fields;
    }
}
