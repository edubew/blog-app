require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'Sam', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
     bio: 'Teacher from Poland.', post_counter: 0)
     @post = Post.create(author: @user1, title: 'Test Post', text: 'This is my first test post', comments_counter: 0, 
     likes_counter: 0)
     @comment1 = Comment.create(post: @post, author: @user1, text: 'Hi Tom!, Nice comment')
      visit user_posts_path(@user1) # Use the named route 'user_posts_path' to visit the posts index page for the user
save_and_open_page
  end

  scenario 'I can see the username, profile picture, and number of posts for each user' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
    expect(page.html).to include(@user1.photo)
    expect(page).to have_content(@user1.post_counter)
    expect(page).to have_content(@post.likes_counter)
    expect(page).to have_content(@post.comments_counter)
    expect(page).to have_content(@user1.name, count: 2)# Ensure commenters' username is displayed
  end
end
