require 'rails_helper'

RSpec.feature "user can sign in as user" do
  scenario "from main page" do
    user = create(:user)

    visit("/")
    click_on("Login as User")

    expect(current_path).to eq(users_login_path)

    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: "Samplepassword"
    click_on("Log in as User")

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome #{user.username}! Logged in as User")
    expect(page).to_not have_content("Log in as User")
    expect(page).to have_content("Logout")
  end

  scenario "after clicking 'post new gif'" do

  end
end
