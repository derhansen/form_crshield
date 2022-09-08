<?php

defined('TYPO3') or die();

(static function () {
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup(
        'page.includeJSFooter.formCrshield = EXT:form_crshield/Resources/Public/JavaScript/FormCrShield.js'
    );

    $GLOBALS['TYPO3_CONF_VARS']['SC_OPTIONS']['ext/form']['afterInitializeCurrentPage'][] = \Derhansen\FormCrshield\Hooks\Form::class;
    $GLOBALS['TYPO3_CONF_VARS']['SC_OPTIONS']['ext/form']['afterSubmit'][] = \Derhansen\FormCrshield\Hooks\Form::class;
})();