<?php


namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\ComponentModel\IComponent;

class UserPresenter extends Nette\Application\UI\Presenter
{
    /** @var Nette\Security\Passwords */
    private $passwords;

    /** @var Nette\Database\Context */
    private $database;

    public function __construct(Nette\Database\Context $database, Nette\Security\Passwords $passwords) {
        $this->database = $database;
        $this->passwords = $passwords;
    }


    protected function createComponentSignInForm(): Nette\Application\UI\Form
    {
        $form = new Form;
        $form->addText("login", "Username")->setRequired("Please set your login");
        $form->addPassword("password", "Password")->setRequired("Please set your password");

        $form->addSubmit("send", "Login");
        $form->onSuccess[] = [$this, 'signInFormSucceed'];

        return $form;
    }

    protected function createComponentRegisterForm(): Nette\Application\UI\Form
    {
        $form = new Form;
        $form->addText("name", "Meno")->setRequired("Zadaj meno");
        $form->addText("login", "Username")->setRequired("Please set your login");
        $form->addPassword("password", "Password")->setRequired("Please set your password");

        $form->addSubmit("send", "Login");
        $form->onSuccess[] = [$this, 'registerFormSucceed'];

        return $form;
    }

    public function signInFormSucceed(Form $form, \stdClass $values) : void {
        try {
            $this->getUser()->login($values->login, $values->password);
            $this->redirect("Homepage:posts");
        } catch (Nette\Security\AuthenticationException $e) {
            $form->addError("Invalid credentials.");
        }
    }

    public function registerFormSucceed(Form $form, \stdClass $values) {
        if ($this->database->table("users")->where("login", $values->login)->count() != 0) {
            $form->addError("User already exists");
            return;
        }

        $this->database->table("users")->insert([
            "login" => $values->login,
            "name" => $values->name,
            "password" => $this->passwords->hash($values->password)
        ]);

        $this->getUser()->login($values->login, $values->password);
        $this->redirect("Homepage:posts");
    }

    public function actionOut() {
        $this->getUser()->logout();
        $this->redirect("Homepage:posts");
    }
}