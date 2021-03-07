<?php

use App\Router\Router;

require dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . "vendor/autoload.php";

define('BASE_PATH', '/cda/webscraping');
define('SERVER_URI', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . BASE_PATH);

$router = new Router($_GET['url']?? "");

session_start();

$router->get('/', "User#index");

if (!isset($_SESSION['user'])) {
    $router->get('/signin', "User#signin");
    $router->post('/signin', "User#checkFormLogin");
    
    $router->get('/signup', "User#signup");
    $router->post('/signup', "User#checkForm");
    
    $router->get('/confirm-:slug', "User#validate");
} else {
    $router->get('/user/logout', "User#logout");

    $router->get('/user/account', "User#show");
    $router->post('/user/account', "User#checkFormAccount");

    $router->get('/user/extraction/register', "Extraction#register");
    $router->post('/user/extraction/register', "Extraction#checkForm");

}





//TODO
$router->post('/user/account/delete', function () {
    echo "POST delete compte user";
});

$router->get('/exctraction/:id/history', function ($id) {
    echo "history $id";
});
$router->get('/exctraction/register', function () {
    echo "new extraction form";
});
$router->post('/exctraction/register', function () {
    echo "POST new extraction form";
});

$router->start();
