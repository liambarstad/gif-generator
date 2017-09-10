FactoryGirl.define do
  factory :gif do
    sequence :name do |i|
      "Samplename#{i}"
    end
    sequence :image_path do |i|
      "Sampleimage#{i}"
    end
  end
end
