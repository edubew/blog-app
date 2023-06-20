require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  include Rails.application.routes.url_helpers

  let!(:user1) { User.create(name: 'John', bio: 'Teacher from North America', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 0) }
  let!(:user2) { User.create(name: 'Jane Smith', photo: 'https://unsplash.com/es/fotos/mEZ3PoFGs_k', post_counter: 10) }

  before do
    user1.posts.create!([
                          { title: 'Post 1', text: 'Lorem ipsum dolor sit amet' },
                          { title: 'Post 3', text: 'Sed do eiusmod tempor incididunt' },
                          { title: 'Post 4', text: 'Ut labore et dolore magna aliqua' },
                          { title: 'Post 5', text: 'Ut enim ad minim veniam' }
                        ])

    visit user_path(user1)
  end

  scenario 'displays the user profile info: name' do
    expect(page).to have_content(user1.name)
  end

  scenario 'displays the user profile info: picture' do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays the user profile info: number of posts' do
    expect(page).to have_content("Number of posts: #{user1.post_counter}")
  end

  scenario 'displays the user profile info: bio' do
    expect(page).to have_content(user1.bio)
  end

  scenario 'displays only 3 first posts' do
    expect(page).to have_content('Sed do eiusmod tempor incididunt')
    expect(page).to have_content('Ut labore et dolore magna aliqua')
    expect(page).to have_content('Ut enim ad minim veniam')
  end

  scenario 'displays button to see all posts' do
    expect(page).to have_content('See all posts')
  end

  scenario 'user is directed to all posts when clicking on button' do
    find('a.button').click
    expect(page).to have_current_path(user_posts_path(user1) + '/')
  end

  scenario 'user is directed to individual post when clicking over post' do
    click_link 'Sed do eiusmod tempor incididunt'
    post = user1.posts.find_by(title: 'Post 3').id

    expect(page).to have_current_path(user_post_path(user1, post))
  end
end
