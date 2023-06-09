class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes

    # Method to update the posts counter for a user.
    def update_user_posts_counter
        user.update(posts_counter: user.posts.count)
    end

    # Method to retrieve most recent comments for a given post
    def recent_comments
        comments.order(created_at: :desc).limit(5)
    end
end
