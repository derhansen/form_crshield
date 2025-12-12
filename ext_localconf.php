<?php

defined('TYPO3') or die();

use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

ExtensionManagementUtility::addTypoScriptSetup(
    'page.includeJSFooter.formCrshield = EXT:form_crshield/Resources/Public/JavaScript/FormCrShield.js'
);
