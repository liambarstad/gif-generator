FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "Sampleusername#{i}"
    end
    sequence :email do |i|
      "Sampleemail#{i}"
    end
    password "Samplepassword"
    admin false
  end
end
