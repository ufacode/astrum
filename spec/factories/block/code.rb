# frozen_string_literal: true

FactoryBot.define do
  factory :block_code, class: 'Block::Code' do
    language { Faker::Hacker.noun }
    content { Faker::Lorem.paragraph }

    after(:build) do |block_code|
      block = FactoryBot.create(:block_)
      block_code.block = block
    end
  end
end
