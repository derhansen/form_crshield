<?php

defined('TYPO3') or die();

use Derhansen\FormCrshield\Hooks\Form;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

(static function () {
    ExtensionManagementUtility::addTypoScriptSetup(
        'page.includeJSFooter.formCrshield = EXT:form_crshield/Resources/Public/JavaScript/FormCrShield.js'
    );

    $GLOBALS['TYPO3_CONF_VARS']['SC_OPTIONS']['ext/form']['afterInitializeCurrentPage'][] = Form::class;
    $GLOBALS['TYPO3_CONF_VARS']['SC_OPTIONS']['ext/form']['afterSubmit'][] = Form::class;
})();
