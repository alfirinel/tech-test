<?php

namespace app\core;


class Route
{
    static public function init()
    {
        $uri = parse_url($_SERVER['REQUEST_URI']);
        $uriComponents = explode('/', $uri['path']);
        array_shift($uriComponents);
        if (count($uriComponents) > 2) {
            self::notFound();
        }
        $controllerName = 'index';
        $actionName = 'index';
        if (!empty($uriComponents[0])) {
            $controllerName = strtolower($uriComponents[0]);
        }
        if (!empty($uriComponents[1])) {
            $actionName = strtolower($uriComponents[1]);
        }
        $controllerClassName = '\app\controllers\\' . ucfirst($controllerName);
        if (!class_exists($controllerClassName)) {
            self::notFound();
        }
        $controller = new $controllerClassName();
        if (!method_exists($controller, $actionName)) {
            self::notFound();
        }
        $controller->$actionName();
    }


    static public function notFound()
    {
        http_response_code('404');
        exit();
    }


    public static function url($action = 'index')
    {
        return "/?action=$action";
    }

    public static function redirect($action = 'index', $controller = 'index')
    {
        $url = "/$controller/$action";
        var_dump($url);
        header("Location: $url");
        exit();
    }
}