require 'rails_helper'

RSpec.feature "user can unfavorite a gif" do
  scenario "from main page" do
    gif = create(:gif)
    user = login_user
    favorite = create(:favorite, user: user, gif: gif)

    visit(gifs_path)
    click_on("Unfavorite")

    expect(current_path).to eq(gifs_path)
  end

  scenario "from single gif page" do
    gif = create(:gif)
    user = login_user
    favorite = create(:favorite, user: user, gif: gif)

    visit(gifs_path)
    click_on(gif.name)
    click_on("Unfavorite")

    expect(current_path).to eq(gif_path(gif))
  end
end
