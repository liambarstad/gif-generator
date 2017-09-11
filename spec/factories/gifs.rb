FactoryGirl.define do
  factory :gif do
    sequence :name do |i|
      "Samplename#{i}"
    end
    image_path "http://api.giphy.com/v1/gifs/feqkVgjJpYtjy?api_key= 25ed4d3593cb468ab591f8aa74562e70"
  end
end
