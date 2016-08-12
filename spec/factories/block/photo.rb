# frozen_string_literal: true
FactoryGirl.define do
  factory :block_photo, class: 'Block::Photo' do
    photo { Faker::Internet.url }

    after(:build) do |block_file|
      block = FactoryGirl.create(:block)
      block_file.block = block
    end
  end
end
