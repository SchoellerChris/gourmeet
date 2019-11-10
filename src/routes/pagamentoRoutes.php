<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function (App $app) {
    $container = $app->getContainer();

    $app->get('/pagamento/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        $resultSet = $conexao->query("UPDATE mesa SET status = 0 where numeroMesa = (".$_SESSION['numeroDaMesaSession'].");");

        session_destroy();
        

        return $response->withRedirect('http://localhost:8888/login/');
    });
};
