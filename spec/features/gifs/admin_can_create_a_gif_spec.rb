require 'rails_helper'

RSpec.feature "admin can create a gif" do
  scenario "from main page" do
    admin = login_admin

    visit(root_path)
    click_on("Create New Gif")

    expect(current_path).to eq(new_gif_path)

    fill_in "search", with: "Pickles"
    click_on("Search GIPHY")
    fill_in "gif[name]", with: "A New One"

    expect(current_path).to eq(new_gif_path)
    expect(page).to have_css("img[src*='https://media2.giphy.com/media/l0Hlwz5lw2jAsxWO4/200.gif']")

    check(match: :first)
    click_on("Post Gif")

    expect(current_path).to eq(gif_path(1))
    expect(page).to have_content("A New One")
    expect(page).to have_css("img[src*='https://media2.giphy.com/media/l0Hlwz5lw2jAsxWO4/200.gif']")
  end

  scenario "with multiple categories" do

  end

  scenario "when creating category" do

  end
end
