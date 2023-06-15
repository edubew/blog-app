require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'update_posts_counter' do
    let(:user) { User.create!(name: 'Winnie', post_counter: 0) }

    it 'updates the post_counter of the user' do
      expect do
        user.posts.create!(title: 'Post 1')
        user.posts.create!(title: 'Post 2')
        user.reload
      end.to change { user.post_counter }.from(0).to(2)
    end
  end
end
