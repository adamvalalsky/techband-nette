<?php


namespace App\Authenticators;

use Nette;
use Nette\Security\AuthenticationException;
use Nette\Security\IIdentity;
use Nette\Security\Passwords;

class DBAuthenticator implements Nette\Security\IAuthenticator
{
    private $database;
    private $passwords;

    public function __construct(Nette\Database\Context $database, Nette\Security\Passwords $passwords)
    {
        $this->database = $database;
        $this->passwords = $passwords;
    }

    function authenticate(array $credentials): IIdentity
    {
        [$login, $password] = $credentials;

        $row = $this->database->table("users")->where("login", $login)->fetch();

        if (!$row) {
            throw new Nette\Security\AuthenticationException("User not found");
        }

        if (!$this->passwords->verify($password, $row->password)) {
            throw new Nette\Security\AuthenticationException("Invalid password");
        }

        return new Nette\Security\Identity(
            $row->id,
            null,
            ["login" => $row->login, "name" => $row->name]
        );
    }
}