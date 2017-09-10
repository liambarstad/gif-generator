require 'rails_helper'

RSpec.describe Gif, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image_path) }
  it { should have_many(:favorites) }
  it { should have_many(:users) }
end
