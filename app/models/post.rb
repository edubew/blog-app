class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Method to update the posts counter for a user.
  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  # Method to retrieve most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
