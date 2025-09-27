<?php

$EM_CONF[$_EXTKEY] = [
    'title' => 'Challenge/response spambot protection for ext:form',
    'description' => 'Adds a hidden input field containing a challenge string to forms. Client must execute included JavaScript to calculate the expected response.',
    'category' => 'fe',
    'author' => 'Torben Hansen',
    'author_email' => 'derhansen@gmail.com',
    'state' => 'stable',
    'uploadfolder' => '0',
    'createDirs' => '',
    'clearCacheOnLoad' => 1,
    'version' => '3.0.0',
    'constraints' => [
        'depends' => [
            'typo3' => '13.4.0-13.4.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
