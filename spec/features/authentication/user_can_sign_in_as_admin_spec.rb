require 'rails_helper'

RSpec.feature "user can sign in as admin" do
  scenario "from main page" do
    admin = create(:user, admin: true)

    visit("/")
    click_on("Login as Admin")

    expect(current_path).to eq(admins_login_path)

    fill_in "user[username]", with: admin.username
    fill_in "user[password]", with: "Samplepassword"
    click_on("Log in as Admin")

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome #{admin.username}! Logged in as Admin")
    expect(page).to_not have_content("Log in as Admin")
    expect(page).to have_content("Logout")
  end

  scenario "after clicking 'post new gif'" do

  end
end
