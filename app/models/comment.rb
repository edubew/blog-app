class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id, required: true
    belongs_to :post

    after_save :update_comments_counter

    # Method to update comments counter for a post
    def update_comments_counter
        post.update(comments_counter: post.comments.count)
    end
end
