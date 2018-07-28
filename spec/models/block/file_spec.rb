# frozen_string_literal: true

RSpec.describe Block::File, type: :model do
  subject { FactoryBot.build(:block_file) }

  context 'with validation' do
    it 'checks empty file' do
      subject.file = nil
      subject.valid?
      expect(subject.errors[:file].count).to be 0
    end
  end
end
