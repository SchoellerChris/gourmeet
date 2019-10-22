<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function (App $app) {
    $container = $app->getContainer();


    $app->get('/cartview/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        if (isset($_SESSION['produtos']) > 0) {

            $soma = 0;
            foreach ($_SESSION['produtos'] as $key => $value) {
                (float) $soma += (float) $value[0]['precoProduto'];
            }
            $_SESSION['totalCompra'] = $soma;
        } else {
            return $response->withRedirect('http://localhost:8888');
        }



        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });

    $app->get('/cart/[{idproduto}]', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        $resultSet = $conexao->query('SELECT * from produto where idProduto =' . $args['idproduto'] . '')->fetchAll();


        $_SESSION['produtos'][] = $resultSet;


        $somaTotal = 0;
        foreach ($_SESSION['produtos'] as $key => $value) {
            $somaTotal += $value[0]['precoProduto'];
        }
        $_SESSION['totalCompra'] = $somaTotal;

        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });

    $app->get('/cartlimpar/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");

        session_destroy();

        return $response->withRedirect('http://localhost:8888');
    });
};
