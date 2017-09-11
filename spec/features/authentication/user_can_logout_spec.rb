require 'rails_helper'

RSpec.feature "user can logout" do
  scenario "from main page" do
    login_user

    click_on("Logout")

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login as User")
  end
end
