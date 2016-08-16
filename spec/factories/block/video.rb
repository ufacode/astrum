# frozen_string_literal: true
FactoryGirl.define do
  factory :block_video, class: 'Block::Video' do
    video { Faker::Internet.url }

    after(:build) do |block_video|
      block = FactoryGirl.create(:block)
      block_video.block = block
    end
  end
end
