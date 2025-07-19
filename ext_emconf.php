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
    'version' => '2.0.1',
    'constraints' => [
        'depends' => [
            'typo3' => '13.2.0-13.4.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
