require 'rails_helper'

RSpec.feature "admin can destroy a category" do
  scenario "from main page" do
    admin = login_admin
    category = create(:category)
    gif1, gif2 = create_list(:gif, 2)
    category_gif1 = create(:category_gif, category: category, gif: gif1)
    category_gif2 = create(:category_gif, category: category, gif: gif2)

    visit(root_path)
    click_on("All Categories")
    click_on("Delete", match: :first)

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category.name)

    click_on("Back to Main")
    click_on("All Gifs")

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
  end

  scenario "from user categories" do
    admin = login_admin
    category = create(:category)
    gif1, gif2 = create_list(:gif, 2)
    category_gif1 = create(:category_gif, category: category, gif: gif1)
    category_gif2 = create(:category_gif, category: category, gif: gif2)
    favorite1 = create(:favorite, user: admin, gif: gif1)
    favorite2 = create(:favorite, user: admin, gif: gif2)

    visit(user_categories_path)
    click_on("Delete", match: :first)

    expect(current_path).to eq(user_categories_path)
    expect(page).to_not have_content(category.name)

    click_on("Back to Main")
    click_on("All Gifs")

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
  end

  scenario "from category" do
    admin = login_admin
    category = create(:category)
    gif1, gif2 = create_list(:gif, 2)
    category_gif1 = create(:category_gif, category: category, gif: gif1)
    category_gif2 = create(:category_gif, category: category, gif: gif2)

    visit(category_path(category))
    click_on("Delete Category")

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category.name)

    click_on("Back to Main")
    click_on("All Gifs")

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
  end

  scenario "from user category" do
    admin = login_admin
    category = create(:category)
    gif1, gif2 = create_list(:gif, 2)
    category_gif1 = create(:category_gif, category: category, gif: gif1)
    category_gif2 = create(:category_gif, category: category, gif: gif2)
    favorite1 = create(:favorite, user: admin, gif: gif1)
    favorite2 = create(:favorite, user: admin, gif: gif2)

    visit(user_category_path(category))
    click_on("Delete Category")

    expect(current_path).to eq(user_categories_path)
    expect(page).to_not have_content(category.name)

    click_on("Back to Main")
    click_on("All Gifs")

    expect(page).to have_content(gif1.name)
    expect(page).to have_content(gif2.name)
  end
end
