<?php

$EM_CONF[$_EXTKEY] = [
    'title' => 'Form challenge/response spambot shield',
    'description' => 'Challenge/response spambot protection for ext:form',
    'category' => 'fe',
    'author' => 'Torben Hansen',
    'author_email' => 'derhansen@gmail.com',
    'state' => 'stable',
    'uploadfolder' => '0',
    'createDirs' => '',
    'clearCacheOnLoad' => 1,
    'version' => '1.4.0',
    'constraints' => [
        'depends' => [
            'typo3' => '10.4.29-12.4.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
