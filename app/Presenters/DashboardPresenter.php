<?php


namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;

class DashboardPresenter extends Nette\Application\UI\Presenter
{

    /** @var Nette\Security\Passwords */
    private $passwords;

    /** @var Nette\Database\Context */
    private $database;

    public function __construct(Nette\Security\Passwords $passwords, Nette\Database\Context $database)
    {
        $this->passwords = $passwords;
        $this->database = $database;
    }

    protected function startup()
    {
        parent::startup();

        if (!$this->getUser()->isLoggedIn()) {
            $this->redirect("User:signin");
        }
    }

    protected function createComponentChangePasswordForm(): Nette\Application\UI\Form
    {
        $form = new Form();
        $form->addPassword("old_password", "Old password")->setRequired("Please set your password");
        $form->addPassword("new_password", "New password")->setRequired("Please set your password");
        $form->addPassword("new_password_again", "New password again")->setRequired("You didn't repeat new password");

        $form->addSubmit("send", "Change password");
        $form->onSuccess[] = [$this, 'changePasswordFormSucceed'];
        return $form;
    }

    public function changePasswordFormSucceed(Form $form, \stdClass $values) {
        if ($values->new_password != $values->new_password_again) {
            $form->addError("Passwords don't match");
            return;
        }

        $userPassword = $this->database->table("users")->get($this->getUser()->id)->password;
        if (!$this->passwords->verify($values->old_password, $userPassword)) {
            $form->addError("Old password is incorrect");
            return;
        }

        $this->database->table("users")->where("id", $this->getUser()->id)->update([
            "password" => $this->passwords->hash($values->new_password)
        ]);

        $this->flashMessage("Heslo bolo úspešne zmenené");
        $this->redirect("Dashboard:profile");
    }
}