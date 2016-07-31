# frozen_string_literal: true
FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }

    after(:build) { |company| company.users << FactoryGirl.create(:user) }
  end
end
