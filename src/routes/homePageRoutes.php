<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function (App $app) {
    $container = $app->getContainer();

    $app->get('/[{idCategoria}]', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');

        // Busca todas as categorias
        $resultSet = $conexao->query('SELECT * FROM categoria')->fetchAll();


        $args['categorias'] = $resultSet;

        

            
        

        if (isset($args['idCategoria'])) {

            // Busca produtos da categoria atual
            $resultSet = $conexao->query('SELECT * FROM produto where idCategoria = ' . $args['idCategoria'])->fetchAll();
            
            // Busca dados da categoria atual
            $resultSetCategoriaAtual = $conexao->query('SELECT * FROM categoria where idCategoria = ' . $args['idCategoria'])->fetchAll();
            $args['categoriaAtual'] = $resultSetCategoriaAtual;
            
        } else {

            $resultSet = $conexao->query('SELECT * FROM produto where ehDestaque=1')->fetchAll();
            $args['categoriaAtual'][] = array('nomeCategoria' => 'Destaques');

        }
        $args['produtos'] = $resultSet;




        // Render index view
        return $container->get('renderer')->render($response, 'index.phtml', $args);
    });
    $app->get('/login/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message

        $container->get('logger')->info("Slim-Skeleton '/' route");
        $conexao = $container->get('pdo');


        $resultSet = $conexao->query('SELECT * FROM mesa')->fetchAll();
        $args['mesas']=$resultSet;

        // Render index view
        return $container->get('renderer')->render($response, 'telaLoginMesa.phtml', $args);
    });
   

};
