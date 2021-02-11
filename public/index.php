<?php

use App\Controller\Controller;
use App\Controller\Extraction\ExtractionController;
use App\Controller\User\UserController;
use App\Models\User\User;
use App\Router\Router;

require dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . "vendor/autoload.php";

define('BASE_PATH', '/cda/webscrapping'); //adrienp/www/public/annonce/public
define('SERVER_URI', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . BASE_PATH);

$router = new Router($_GET['url']?? "");
$controllerView = new Controller();
$controller = new UserController();
$controllerE = new ExtractionController();

session_start();

$router->get('/signin', "User#signin");
$router->post('/signin', "User#checkFormLogin");

$router->get('/signup', "User#signup");
$router->post('/signup', "User#checkForm");

$router->get('/user/logout', "User#logout");

$router->get('/confirm-:slug', "User#validate");

$router->get('/', "User#index");


$router->get('/user/account', "User#show");
$router->post('/user/account', "User#checkFormAccount");

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
