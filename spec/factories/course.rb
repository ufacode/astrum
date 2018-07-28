# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { Faker::Company.name }

    after(:build) do |course|
      company = FactoryBot.create(:company)
      course.company = company
    end
  end
end
