# frozen_string_literal: true

FactoryBot.define do
  factory :lecture do
    name { Faker::Company.name }

    after(:build) do |lecture|
      course = FactoryBot.create(:course)
      lecture.course = course
    end
  end
end
