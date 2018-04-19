# frozen_string_literal: true

FactoryGirl.define do
  factory :block_text, class: 'Block::Text' do
    content { Faker::Lorem.paragraph }

    after(:build) do |block_text|
      block = FactoryGirl.create(:block_)
      block_text.block = block
    end
  end
end
