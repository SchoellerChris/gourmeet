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


      //   if (array_search($args['idproduto'], $_SESSION['compraUltimoProduto']) == FALSE) {
        // Primeira adição do produto no carrinho

        $resultSet = $conexao->query('SELECT * from produto where idProduto =' . $args['idproduto'] . '')->fetchAll();
        $resultSet[0]['qtdProduto'] = 1;
        $_SESSION['idProdutoCarrinho'] = $args['idproduto'];

        $_SESSION['produtos'][] = $resultSet;


        #função de soma do carrinho.
        $somaTotal = 0;
        foreach ($_SESSION['produtos'] as $key => $value) {
            $somaTotal += $value[0]['precoProduto'];
            $_SESSION['totalCompra'] = $somaTotal;
        }

        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });

    //apagar item selecionado do carrinho 
    //terminar antes de enviar


    //implementar depois





    $app->get('/cartapagaritem/[{contador}]', function (Request $request, Response $response, array $args) use ($container) {
        //Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        // função para apagar o item do carrinho

        
        
        
        $_SESSION['produtos'][$args['contador']][0]['precoProduto'] = 0;
        
        
        unset($_SESSION['produtos'][$args['contador']]);
        

       
        
        

        




        return $container->get('renderer')->render($response, 'cart.phtml', $args);
    });







    $app->get('/cartlimpar/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");

        session_destroy();

        return $response->withRedirect('http://localhost:8888/login/');
    });



    $app->get('/salvarpedido/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        //print_r($_SESSION['nomeDoCliente']$_SESSION['numeroDaMesa']);
        //exit();

      
        $resultSet = $conexao->query("INSERT INTO pedido (precoPedido,idMesa) VALUES (" . (float) $_SESSION['totalCompra'] . ",". $_SESSION['numeroDaMesa'].")");



        $pedidoUltimoId = $conexao->lastInsertId();


        foreach ($_SESSION['produtos'] as $key => $value) {
           $pedidoUltimoIdProduto = $_SESSION[$key]['idProduto'];

             

            //    $resultSet = $conexao->query("INSERT INTO pedidoproduto (idPedido,idProduto) VALUES ('" . (int) $pedidoUltimoId . "," . (int) $value[0]['idProduto'] .");");
               
           //     $resultSet = $conexao->query("INSERT INTO categoria (nomeCategoria) VALUES ('".$params['categoria']."');");           
            
            

        }

        
        //for each pedido confirmado criar em baixo dos outros pedidos os pedidos.
        //
        //
        //
        session_destroy();
        return $response->withRedirect('http://localhost:8888/login/');
    });
    $app->get('/pagamento/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

       // $resultSet = $conexao->query("UPDATE mesa SET status = 0 where numeroMesa = (".$_SESSION['numeroDaMesaSession'].");");

        session_destroy();
        

        //return $response->withRedirect('http://localhost:8888/login/');
        return $container->get('renderer')->render($response, 'pagamento.phtml', $args);

    });
    $app->get('/confirmado/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

       //$resultSet = $conexao->query("UPDATE mesa SET status = 0 where numeroMesa = (".$_SESSION['numeroDaMesaSession'].");");

        session_destroy();
        

        return $response->withRedirect('http://localhost:8888/login/');
      

    });

};
