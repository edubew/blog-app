require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Winnie') }
  let!(:post) { Post.create!(title: 'Sample Post', author: user, likes_counter: 1, comments_counter: 0, post_counter: 0) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end

  describe 'methods' do
    describe '#update_likes_counter' do
      it 'updates the likes_counter of the post' do
        Like.create(author_id: user.id, post: post)
        post.reload
        expect(post.likes_counter).to eq(1)
      end
    end
  end
end
