require 'rails_helper'

RSpec.feature "visitor can create new user" do
  scenario "from main page" do
    user = build(:user)

    visit(root_path)
    click_on("Create New User")

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: user.username
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_on("Create")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome New User #{user.username}!")
  end
end
