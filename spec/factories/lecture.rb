# frozen_string_literal: true
FactoryGirl.define do
  factory :lecture do
    name { Faker::Company.name }

    after(:build) do |lecture|
      course = FactoryGirl.create(:course)
      lecture.course = course
    end
  end
end
