# frozen_string_literal: true

FactoryGirl.define do
  factory :block_ do
    after(:build) do |block|
      lecture = FactoryGirl.create(:lecture)
      block.lecture = lecture
    end
  end
end
