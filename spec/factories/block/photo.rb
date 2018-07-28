# frozen_string_literal: true

FactoryBot.define do
  factory :block_photo, class: 'Block::Photo' do
    photo { Faker::Internet.url }

    after(:build) do |block_file|
      block = FactoryBot.create(:block_)
      block_file.block = block
    end
  end
end
