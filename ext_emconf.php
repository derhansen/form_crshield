<?php

$EM_CONF[$_EXTKEY] = [
    'title' => 'Challenge/response spambot protection for ext:form',
    'description' => 'Adds a hidden input field containing a challenge string to forms. Client must execute included JavaScript to calculate the expected response.',
    'category' => 'fe',
    'author' => 'Torben Hansen',
    'author_email' => 'derhansen@gmail.com',
    'state' => 'stable',
    'version' => '4.0.1',
    'constraints' => [
        'depends' => [
            'typo3' => '14.3.0-14.3.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
