<?php

namespace Helper;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class Acceptance extends \Codeception\Module
{
    public function grabResponseHeaders(string $name): array
    {
        /** @var \Codeception\Module\PhpBrowser $phpBrowser */
        $phpBrowser = $this->getModule('PhpBrowser');
        $headers = array_change_key_case($phpBrowser->client->getInternalResponse()->getHeaders());
        return $headers[strtolower($name)] ?? [];
    }
}
