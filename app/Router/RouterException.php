<?php

namespace App\Router;

use Exception;

class RouterException extends Exception
{
    static function view()
    {
        header('Location: '.SERVER_URI);
        exit();
    }
}
