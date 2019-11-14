<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;

return function (App $app) {
    $container = $app->getContainer();

    $app->post('/homepage/', function (Request $request, Response $response, array $args) use ($container) {
        // Sample log message
        $container->get('logger')->info("Slim-Skeleton '/' route");
            
            $params = $request -> getParsedBody();
            $conexao = $container->get('pdo');
          
            
            $_SESSION['nomeDoClienteSession'] = $params['nomeDoCliente'];
            $_SESSION['numeroDaMesaSession']  = $params['mesas'];
            
            if ($params['mesas']==0) {
                return $response->withRedirect('/login/');
            }
            else{

                $resultSet = $conexao->query("UPDATE mesa SET status = 1 where numeroMesa = (".$params['mesas'].")");
                
                
                
                if (!$_SESSION['numeroDaMesaSession']) {
                    //mensagem de erro
                }
                else {
                    
                    
                  $resultSet = $conexao->query("INSERT INTO cliente (nome) VALUES ('".$_SESSION['nomeDoClienteSession']."');");
                    
                    return $response->withRedirect('/');
                }
                
            }
            

        // Render index view
    });
};
