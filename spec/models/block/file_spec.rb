# frozen_string_literal: true

RSpec.describe Block::File, type: :model do
  subject { FactoryBot.build(:block_file) }

  context 'with validation' do
    it 'checks empty file' do
      subject.file = nil
      subject.valid?
      expect(subject.errors[:file].any?).to be_falsey
    end
  end
end
