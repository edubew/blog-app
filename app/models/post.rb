class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, required: true, counter_cache: :post_counter
  has_many :comments
  has_many :likes

  attribute :post_counter, :integer, default: 0

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  after_save :update_posts_counter

  def update_posts_counter
    Post.update_post_counter(author_id)
  end

  # Retrieve most recent posts
  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  def self.update_post_counter(user_id)
    user = User.find(user_id)
    user.update(post_counter: user.posts.count)
  end
end
