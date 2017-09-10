require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:category_gifs) }
  it { should have_many(:gifs) }
end
