# frozen_string_literal: true

FactoryBot.define do
  factory :block_text, class: 'Block::Text' do
    content { Faker::Lorem.paragraph }

    after(:build) do |block_text|
      block = FactoryBot.create(:block_)
      block_text.block = block
    end
  end
end
