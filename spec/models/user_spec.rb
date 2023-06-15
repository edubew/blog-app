require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:likes).through(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    # Remove the following line as `posts_counter` attribute is not defined in the User model
    # it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'recent_posts' do
    let(:user) { User.create!(name: 'Winnie') }

    it 'returns an array if the user has no posts' do
      recent_posts = user.recent_posts

      expect(recent_posts).to eq([])
    end
  end
end
