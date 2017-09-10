require 'rails_helper'

RSpec.feature "user can see gifs sorted by category" do
  scenario "from main page" do
    category1 = create(:category, name: "phunstuff")
    category2 = create(:category, name: "phunjunk")
    gif1, gif2, gif3, gif4 = create_list(:gif, 4)
    category1gif1 = create(:category_gif, category: category1, gif: gif1)
    category1gif2 = create(:category_gif, category: category1, gif: gif2)
    category2gif2 = create(:category_gif, category: category2, gif: gif2)
    category1gif3 = create(:category_gif, category: category1, gif: gif3)
    category2gif4 = create(:category_gif, category: category2, gif: gif4)
    user = login_user

    visit(root_path)
    click_on("All Categories")

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)

    click_on(category1.name)

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
    expect(page).to have_content(gif3.name)
    expect(page).to_not have_content(gif4.name)
    expect(page).to have_content(gif1.image_path)
    expect(page).to have_content(gif2.image_path)
    expect(page).to have_content(gif3.image_path)
    expect(page).to_not have_content(gif4.image_path)

    click_on("Back to Categories")
    click_on(category2.name)

    expect(page).to have_content(gif2.name)
    expect(page).to have_content(gif4.name)
    expect(page).to_not have_content(gif1.name)
    expect(page).to_not have_content(gif3.name)
    expect(page).to have_content(gif2.image_path)
    expect(page).to have_content(gif4.image_path)
    expect(page).to_not have_content(gif1.image_path)
    expect(page).to_not have_content(gif3.image_path)
  end
end
