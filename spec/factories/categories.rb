FactoryGirl.define do
  factory :category do
    sequence :name do |i|
      "Category#{i}"
    end
  end
end
