require 'rspec/rails'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Renders a successful response' do
      user = User.create(name: 'Winnie')
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('No posts for this user!')
    end
  end

  describe 'GET /show' do
    it 'Renders a successful response' do
      post = Post.create(title: 'My Post', text: 'Some content')
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
