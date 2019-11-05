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
            
          
            
            $_SESSION['nomeDoCliente']= $params['numeroMesa'];
            $_SESSION['numeroDaMesa'] = $params['nomeCliente'];
            

            if (!$_SESSION['numeroDaMesa']) {
                //mensagem de erro
            }
            else {
                return $response->withRedirect('http://localhost:9898');
            }
            
            

        // Render index view
    });
};