require 'rails_helper'

RSpec.describe CategoryGif, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:gif) }
end
