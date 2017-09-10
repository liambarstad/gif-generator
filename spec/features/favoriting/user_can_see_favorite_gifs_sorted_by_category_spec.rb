require 'rails_helper'

RSpec.feature "user can see favorite gifs sorted by category" do
  scenario "from main page" do
    user = login_user
    gif1, gif2, gif3 = create_list(:gif, 3)
    favorite1 = create(:favorite, user: user, gif: gif1)
    favorite2 = create(:favorite, user: user, gif: gif2)
    favorite3 = create(:favorite, user: user, gif: gif3 )
    category1, category2 = create_list(:category, 2)
    category_gif_11 = create(:category_gif, gif: gif1, category: category1)
    category_gif_12 = create(:category_gif, gif: gif2, category: category1)
    category_gif_22 = create(:category_gif, gif: gif2, category: category2)
    category_gif_23 = create(:category_gif, gif: gif3, category: category2)

    visit(root_path)
    click_on("Favorites By Category")

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)

    click_on(category1.name)

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
    expect(page).to_not have_content(gif3.name)


    click_on("Back to Favorites by Category")
    click_on(category2.name)

    expect(page).to have_content(gif2.name)
    expect(page).to have_content(gif3.name)
    expect(page).to_not have_content(gif1.name)
  end
end
