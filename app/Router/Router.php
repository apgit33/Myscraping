<?php

namespace App\Router;

class Router
{

    private $url;
    private $routes = [];
    private $namedRoutes = [];

    public function __construct($url)
    {
        $this->url = $url;
    }

    public function get($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'GET');
    }

    public function post($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'POST');
    }

    private function add($path, $callable, $name, $method)
    {
        $route = new Route($path, $callable);

        $this->routes[$method][] = $route;

        if (is_string($callable) && $name === null) {
            $name = $callable;
        }

        if ($name) $this->namedRoutes[$name] = $route;

        return $route;
    }

    public function start()
    {
        if (!isset($this->routes[$_SERVER['REQUEST_METHOD']]))  return RouterException::view();

        foreach ($this->routes[$_SERVER['REQUEST_METHOD']] as $route) {
            if ($route->match($this->url)) return $route->call();
        }

        return RouterException::view();
    }
}
