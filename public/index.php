<?php

use App\Controller\Controller;
use App\Controller\Extraction\ExtractionController;
use App\Controller\User\UserController;
use App\Router\Router;

require dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . "vendor/autoload.php";

define('BASE_PATH', '/'); //adrienp/www/public/annonce/public
define('SERVER_URI', $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . BASE_PATH);

$router = new Router($_GET['url']);
$controllerView = new Controller();
$controller = new UserController();

$router->get('/', function () {
    // $controller = new UserController();
    // $controller->test();
    echo "test";

});
$router->get('/signin', function () {
    // $controller = new AuthController();
    // $controller->login();
    echo "test";
});
$router->get('/signup', function () use ($controllerView) {
    $controllerView->render('form_signup');
});
$router->post('/signup', function ()use ($controller) {
    $controller->checkForm();
});

$router->get('/confirm-:slug', function($slug) use ($controller){
    $controller->validate($slug);
    // header("Refresh:5; url=".SERVER_URI."");
});

$router->get('/user/logout', function () {
    $controller = new UserController();
    $controller->logout();
});
$router->get('/user/account', function () {
    echo "compte user";
});
$router->get('/user/account/edit', function () {
    echo "compte edit user";
});
$router->post('/user/account/edit', function () {
    echo "POST compte edit user";
});
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
