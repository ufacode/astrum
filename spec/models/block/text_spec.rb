# frozen_string_literal: true
RSpec.describe Block::Text, type: :model do
  subject { FactoryGirl.build(:block_text) }

  context 'with validation' do
    it 'checks empty content' do
      subject.content = nil
      subject.valid?
      expect(subject.errors[:content].count).to be 0
    end
  end
end
