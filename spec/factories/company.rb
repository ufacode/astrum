# frozen_string_literal: true
FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
