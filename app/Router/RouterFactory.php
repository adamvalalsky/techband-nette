<?php

declare(strict_types=1);

namespace App\Router;

use Nette;
use Nette\Application\Routers\RouteList;


final class RouterFactory
{
	use Nette\StaticClass;

	public static function createRouter(): RouteList
	{
		$router = new RouteList;
		$router->addRoute('/', 'Homepage:posts');
		$router->addRoute('login', "User:signin");
		$router->addRoute('register', "User:register");
		$router->addRoute('logout', "User:out");

		$router->addRoute('profile', "Dashboard:profile");
        $router->addRoute('change/password', "Dashboard:changepassword");
		$router->addRoute('post/<id>/review/<type>', "Homepage:review");

		return $router;
	}
}
