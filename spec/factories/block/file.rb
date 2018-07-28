# frozen_string_literal: true

FactoryBot.define do
  factory :block_file, class: 'Block::File' do
    file { Faker::Lorem.paragraph }

    after(:build) do |block_file|
      block = FactoryBot.create(:block_)
      block_file.block = block
    end
  end
end
