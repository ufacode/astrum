# frozen_string_literal: true

RSpec.describe Block::Photo, type: :model do
  subject { FactoryBot.build(:block_photo) }

  context 'with validation' do
    it 'checks empty photo' do
      subject.photo = nil
      subject.valid?
      expect(subject.errors[:photo].count).to be 0
    end
  end
end
