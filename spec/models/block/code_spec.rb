# frozen_string_literal: true
RSpec.describe Block::Code, type: :model do
  subject { FactoryGirl.build(:block_code) }

  context 'with validation' do
    it 'checks empty content' do
      subject.content = nil
      subject.valid?
      expect(subject.errors[:content].count).to be 0
    end

    it 'checks empty language' do
      subject.language = nil
      subject.valid?
      expect(subject.errors[:language].count).to be 0
    end
  end
end
