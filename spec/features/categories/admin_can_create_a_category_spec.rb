require 'rails_helper'

RSpec.feature "admin can create a category" do
  scenario "when signed in as admin" do
    admin = login_admin
    category = build(:category)
    gif1, gif2, gif3 = create_list(:gif, 3)
    favorite1 = create(:favorite, user: admin, gif: gif1)
    favorite2 = create(:favorite, user: admin, gif: gif2)

    visit(root_path)
    click_on("New Category")

    expect(current_path).to eq(new_category_path)
    fill_in "category[name]", with: category.name
    click_on("Create Category")

    expect(current_path).to eq(category_path(Category.find_by(name: category.name)))
    expect(page).to_not have_content(gif1.name)
    expect(page).to_not have_content(gif2.name)
    expect(page).to_not have_content(gif3.name)
  end

  scenario "but can't, if not singed in" do
    visit(root_path)

    expect(page).to_not have_content("New Category")

    visit(new_category_path)

    expect(page).to have_content("404")
  end
end
