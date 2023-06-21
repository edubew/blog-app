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
end
