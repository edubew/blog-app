require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'Martin', post_counter: 0)
    @user2 = User.create(name: 'Jane', post_counter: 0)

    # update profile pictures
    @user1.update(photo: 'https://unsplash.com/photos/F_-0BxGuVvo')
    @user2.update(photo: 'https://unsplash.com/es/fotos/mEZ3PoFGs_k')
  end

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content('Martin')
    expect(page).to have_content('Jane')
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    expect(page).to have_css("img[src*='https://unsplash.com/es/fotos/mEZ3PoFGs_k']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content("Number of posts: #{@user1.post_counter}")
    expect(page).to have_content("Number of posts: #{@user2.post_counter}")
  end

  it 'redirects to the user show page when clicking on a user' do
    visit users_path

    first(:link, @user1.name).click

    expect(current_path).to eq(user_path(@user1))
    expect(page).to have_content(@user1.name)
  end
end
