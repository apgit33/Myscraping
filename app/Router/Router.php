<?php

namespace App\Router;

class Router
{

    private $url;
    private $routes = [];

    public function __construct($url)
    {
        $this->url = $url;
    }

    public function get($path, $callable)
    {
       
        $route = new Route($path, $callable);

        $this->routes['GET'][] = $route;

        return $this;
    }

    public function post($path, $callable)
    {
        $route = new Route($path, $callable);

        $this->routes['POST'][] = $route;

        return $this;
    }

    public function start()
    {
        if (!isset($this->routes[$_SERVER['REQUEST_METHOD']])) throw new RouterException('no request  method');

        foreach ($this->routes[$_SERVER['REQUEST_METHOD']] as $route) {
            if ($route->match($this->url)) return $route->call();
        }

        throw new RouterException('404');
    }
}
