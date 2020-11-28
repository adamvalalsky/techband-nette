<?php

declare(strict_types=1);

namespace App\Presenters;

use App\Model\PostManager;
use Nette;


final class HomepagePresenter extends Nette\Application\UI\Presenter
{
    /** @var PostManager */
    private $postManager;

    public function __construct(PostManager $postManager)
    {
        $this->postManager = $postManager;
    }

    public function renderPosts(int $page = 1, string $sort = "title") : void {
        $posts = $this->postManager->getPosts($sort);

        if (!$this->user->isLoggedIn()) {
            $posts->where("visible", 1)->fetch();
        }

        $lastPage = 0;
        $this->template->posts = $posts->page($page, $this->postManager::ITEMS_PER_PAGE, $lastPage);

        $this->template->page = $page;
        $this->template->lastPage = $lastPage;
        $this->template->sort = $sort;
    }

    public function actionReview(int $id, string $type)
    {
        $value = $type == "like" ? 1 : -1;
        $this->postManager->updateReview($id, $this->getUser()->id, $value);

        $this->sendJson([
            "likes" => $this->postManager->getLikes($id),
            "dislikes" => $this->postManager->getDislikes($id)
        ]);

        }

}
