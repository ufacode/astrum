# frozen_string_literal: true

RSpec.describe Block::Code, type: :model do
  subject { FactoryBot.build(:block_code) }

  context 'with validation' do
    it 'checks empty content' do
      subject.content = nil
      subject.valid?
      expect(subject.errors[:content].any?).to be_falsey
    end

    it 'checks empty language' do
      subject.language = nil
      subject.valid?
      expect(subject.errors[:language].any?).to be_falsey
    end
  end
end
