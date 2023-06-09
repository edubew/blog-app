class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    # Method to update comments counter for a post
    def update_posts_comments_counter
        post.update(comments_counter: posts.comments.count)
    end
end
