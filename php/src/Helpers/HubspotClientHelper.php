<?php

namespace Helpers;

use HubSpot\Discovery\Discovery;
use HubSpot\Factory;

class HubspotClientHelper
{
    public static function createFactory(): Discovery
    {
        if (!empty($_ENV['HUBSPOT_API_KEY'])) {
            return Factory::createWithApiKey($_ENV['HUBSPOT_API_KEY']);
        }

        throw new \Exception('Please specify API key');
    }
}
