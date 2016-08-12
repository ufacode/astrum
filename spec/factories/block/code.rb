# frozen_string_literal: true
FactoryGirl.define do
  factory :block_code, class: 'Block::Code' do
    language { Faker::Hacker.noun }
    content { Faker::Lorem.paragraph }

    after(:build) do |block_code|
      block = FactoryGirl.create(:block)
      block_code.block = block
    end
  end
end
