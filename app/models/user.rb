class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', counter_cache: :post_counter
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, through: :posts

  validates :name, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
