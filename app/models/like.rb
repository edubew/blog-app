class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Method to update likes counter for a post
  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
