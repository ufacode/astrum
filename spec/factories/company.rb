# frozen_string_literal: true
FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    domain { Faker::Internet.domain_name }

    after(:build) { |company| company.users << FactoryGirl.create(:user) }
  end
end
