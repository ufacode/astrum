# frozen_string_literal: true

FactoryGirl.define do
  factory :block_file, class: 'Block::File' do
    file { Faker::Lorem.paragraph }

    after(:build) do |block_file|
      block = FactoryGirl.create(:block_)
      block_file.block = block
    end
  end
end
