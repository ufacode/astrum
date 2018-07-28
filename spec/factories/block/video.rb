# frozen_string_literal: true

FactoryBot.define do
  factory :block_video, class: 'Block::Video' do
    video { Faker::Internet.url }

    after(:build) do |block_video|
      block = FactoryBot.create(:block_)
      block_video.block = block
    end
  end
end
