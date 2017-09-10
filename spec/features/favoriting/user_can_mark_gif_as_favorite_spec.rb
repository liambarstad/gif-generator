require 'rails_helper'

RSpec.feature "user can mark gif as favorite" do
  scenario "from all gifs page" do
    gif = create(:gif)
    user = login_user

    click_on("All Gifs")

    expect(current_path).to eq(gifs_path)

    click_on("Favorite")

    expect(current_path).to eq(gifs_path)

    click_on("My Favorites")

    expect(current_path).to eq(user_favorites_path(user))
    expect(page).to have_content(gif.name)

    click_on(gif.name)
    expect(page).to have_content(gif.name)
  end

  scenario "from specific gif page" do
    gif = create(:gif)
    user = login_user

    visit gif_path(gif)
    click_on("Favorite")

    expect(current_path).to eq(gif_path(gif))
  end
end
