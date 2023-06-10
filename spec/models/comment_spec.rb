require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:author).with_foreign_key(:author_id) }
    it { should belong_to(:post) }
  end

  describe 'update_comment_counter' do
    it 'updates the comments counter of the associated post' do
        comment = Comment.new
  
        post = double('Post')
        allow(comment).to receive(:post).and_return(post)
        allow(post).to receive(:comments).and_return([])
        
        expect(post).to receive(:update).with(comments_counter: 0)
        
        comment.update_posts_comments_counter
      end
  end
end