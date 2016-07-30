# frozen_string_literal: true
RSpec.describe Company, type: :model do
  subject { FactoryGirl.build(:company) }

  context 'with validation' do
    it 'checks empty name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].count).to be > 0
    end

    it 'check length of name' do
      subject.name = 'Astrum' * 100
      subject.valid?
      expect(subject.errors[:name].count).to be > 0
    end
  end
end
