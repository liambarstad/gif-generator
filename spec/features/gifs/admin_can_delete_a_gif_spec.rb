require 'rails_helper'

RSpec.feature "admin can delete a gif" do
  scenario "from main page" do
    admin = login_admin
    gif = create(:gif)

    visit(gifs_path)
    click_on("Delete", match: :first)

    expect(current_path).to eq(gifs_path)
    expect(page).to_not have_content(gif.name)
  end
end
