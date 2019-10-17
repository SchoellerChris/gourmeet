<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function  (App $app) {
    $container = $app->getContainer();

    $app->get('/cart/[{idproduto}]', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        $resultSet = $conexao->query('SELECT * from produto where idProduto = '. $args['idproduto'].'')->fetchAll();
        
        $_SESSION['produtos'][] = $resultSet;

        
   
        
        // Render index view
        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });

    $app->get('/cartlimpar/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");

        session_destroy();

        // Render index view
        return $container->get('renderer')->render($response, 'index.phtml', $args);
    });
};
