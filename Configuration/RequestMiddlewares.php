<?php

declare(strict_types=1);

use Derhansen\FormCrshield\Middleware\NonceRequestMiddleware;

return [
    'frontend' => [
        'derhansen/form-crshield/nonce-request' => [
            'target' => NonceRequestMiddleware::class,
            'after' => [
                'typo3/cms-core/normalized-params-attribute',
            ],
            'before' => [
                'typo3/cms-frontend/site',
            ],
        ],
    ],
];
