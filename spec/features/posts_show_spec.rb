require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'Sam', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                         bio: 'Teacher from Poland.', post_counter: 0)
    visit users_path
  end

  scenario 'I can see the username, profile picture, and number of posts for each user' do
    expect(page).to have_content(@user1.name)
    expect(page.html).to include(@user1.photo)
    expect(page).to have_content(@user1.post_counter)
  end

  # scenario 'When I click on a user, I am redirected to their show page' do
  #   # click_on @user1.name
  #   find('.user_content a').click
  #   p page.html
  #   expect(current_path).to eq(user_path(@user1))
  # end
  it 'redirects to the user show page when clicking on a user' do
    visit users_path

    first(:link, @user1.name).click

    expect(current_path).to eq(users_path(@user1))
    expect(page).to have_content(@user1.name)
  end
end