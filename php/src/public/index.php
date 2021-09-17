<?php

use Helpers\OAuth2Helper;

include_once '../../vendor/autoload.php';

session_start();

$uri = parse_url($_SERVER['REQUEST_URI'])['path'];

if ('/' === $uri) {
    header('Location: /import/history');

    exit();
}

try {
    $routes = require '../routes.php';
    
    if (!in_array($uri, $routes)) {
        http_response_code(404);

        exit();
    }

    $path = __DIR__.'/../actions'.$uri.'.php';

    require $path;
} catch (Throwable $t) {
    $message = $t->getMessage();

    include __DIR__.'/../views/error.php';

    exit();
}
