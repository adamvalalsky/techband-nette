<?php


namespace App\Model;

use Nette;

class PostManager
{
    use Nette\SmartObject;

    const ITEMS_PER_PAGE = 3;

    /** @var Nette\Database\Context */
    private $database;


    public function __construct(Nette\Database\Context $database) {
        $this->database = $database;
    }

    public function getPosts($sort) : Nette\Database\Table\Selection
    {
        // sort category doesnt exist -> use default
        if (!in_array($sort, ["name", "reviews", "created_at"])) {
            $sort = "title";
        }
        return $this->database->table("posts")->order("$sort DESC");
    }

    public function updateReview(int $postId, int $userId, int $value) {
        $row = $this->database->table("reviews")->where(["post_id" => $postId, "user_id" => $userId]);
        if ($row->count('id') == 0) {
            // add new record
            $this->database->table("reviews")->insert([
                "user_id" => $userId,
                "post_id" => $postId,
                "value" => $value
            ]);
            $this->updatePostReviewCount($postId, $value);
            return true;
        }

        $oldValue = $row->fetch()->value;
        // check if we are changing our review or deleting a current one
        if ($oldValue == $value) {
            // we are deleting current review
            $value = 0;
        }

        $row->update([
            "value" => $value
        ]);

        // update value for post
        $factor = abs($oldValue) + abs($value);
        $factor = $oldValue > $value ? -$factor : $factor;
        $this->updatePostReviewCount($postId, $factor);
        return true;
    }

    public function getLikes(int $id) : int {
        return $this->getReviews($id,1);
    }

    public function getDislikes(int $id) : int {
        return $this->getReviews($id,-1);
    }

    private function getReviews(int $id, int $value) : int {
        return $this->database->table("reviews")
            ->where(["value" => $value, "post_id" => $id])->count();
    }

    private function updatePostReviewCount(int $postId, int $value) {
        $post = $this->database->table("posts")->get($postId);
        $post->update([
            "reviews" => $post->reviews + $value
        ]);
    }
}