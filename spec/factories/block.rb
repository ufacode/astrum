# frozen_string_literal: true

FactoryBot.define do
  factory :block_ do
    after(:build) do |block|
      lecture = FactoryBot.create(:lecture)
      block.lecture = lecture
    end
  end
end
