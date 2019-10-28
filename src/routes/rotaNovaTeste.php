<?php

use phpDocumentor\Reflection\Types\Float_;
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


        // if (array_search($args['idproduto'], $_SESSION['compraUltimoProduto']) == FALSE) {
        // Primeira adição do produto no carrinho

        $resultSet = $conexao->query('SELECT * from produto where idProduto =' . $args['idproduto'] . '')->fetchAll();
        $resultSet[0]['qtdProduto'] = 1;

        $_SESSION['produtos'][] = $resultSet;

        #função de soma do carrinho.
        $somaTotal = 0;
        foreach ($_SESSION['produtos'] as $key => $value) {
            $somaTotal += $value[0]['precoProduto'];
            $_SESSION['totalCompra'] = $somaTotal;
        }

       

        $_SESSION['compraUltimoProduto'][] = $args['idproduto'];


        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });

    //apagar item selecionado do carrinho 
    //terminar antes de enviar
    //$app->get('/cartapagaritem/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
 //       $container->get('logger')->info("Slim-Skeleton '/' route");

    //    session_destroy();

     //   return $response->withRedirect('http://localhost:8888');
 //   });

    $app->get('/cartlimpar/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");

        session_destroy();

        return $response->withRedirect('http://localhost:8888');
    });

   

    $app->post('/salvarpedido/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
       $container->get('logger')->info("Slim-Skeleton '/' route");
       $conexao = $container ->get('pdo');

      
    
        $conexao->query("INSERT INTO pedido (precoPedido) VALUES (19);");

        

        return $container->get('renderer')->render($response, 'index.phtml', $args);
    });

};
