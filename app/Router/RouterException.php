<?php

namespace App\Router;

use Exception;

class RouterException extends Exception
{
    static function view()
    {
        echo "something wrong";
    }
}
