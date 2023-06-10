require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Winnie') }
  let!(:post) { Post.create!(title: 'Sample Post', author: user, likes_counter: 0, comments_counter: 0) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end

  describe 'methods' do
    describe '#update_likes_counter' do
      it 'updates the likes_counter of the post' do
        post.update(likes_counter: 2)
        like = Like.create(author_id: user.id, post: post)
        post.reload
        expect(post.likes_counter).to eq(2)
      end
    end
  end
end