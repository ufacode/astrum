# frozen_string_literal: true

FactoryGirl.define do
  factory :course do
    name { Faker::Company.name }

    after(:build) do |course|
      company = FactoryGirl.create(:company)
      course.company = company
    end
  end
end
