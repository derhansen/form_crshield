<?php

defined('TYPO3') or die();

use TYPO3\CMS\Core\Cache\Backend\FileBackend;
use TYPO3\CMS\Core\Cache\Frontend\VariableFrontend;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

ExtensionManagementUtility::addTypoScriptSetup(
    'page.includeJSFooter.formCrshield = EXT:form_crshield/Resources/Public/JavaScript/FormCrShield.js'
);

// Cache for single-use nonces (see README.md)
if (!is_array($GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations']['formcrshield'] ?? null)) {
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations']['formcrshield'] = [];
}
$GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations']['formcrshield']['frontend'] ??= VariableFrontend::class;
$GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations']['formcrshield']['backend'] ??= FileBackend::class;
$GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations']['formcrshield']['options'] ??= [];
