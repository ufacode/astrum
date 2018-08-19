# frozen_string_literal: true

RSpec.describe Block::Video, type: :model do
  subject { FactoryBot.build(:block_video) }

  context 'with validation' do
    it 'checks empty video' do
      subject.video = nil
      subject.valid?
      expect(subject.errors[:video].any?).to be_falsey
    end
  end
end
