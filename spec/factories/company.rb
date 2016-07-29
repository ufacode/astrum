FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
