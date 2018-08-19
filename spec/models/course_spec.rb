# frozen_string_literal: true

RSpec.describe Course, type: :model do
  subject { FactoryBot.build(:course) }

  context 'with validation' do
    it 'checks empty name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].any?).to be_truthy
    end

    it 'check length of name' do
      subject.name = 'Astrum' * 100
      subject.valid?
      expect(subject.errors[:name].any?).to be_truthy
    end
  end

  context 'with relation' do
    it 'company not to be nil' do
      subject.company = nil
      subject.valid?
      expect(subject.errors[:company].any?).to be_truthy
    end
  end

  context 'with state machine' do
    it 'will be draft' do
      expect(subject).to have_state :draft
    end

    it 'will be draft' do
      expect(subject).not_to have_state :published
    end

    it 'would be published from draft' do
      expect(subject).to transition_from(:draft).to(:published).on_event(:publish)
      expect(subject).to allow_event :draft
    end

    it 'would be draft from published' do
      expect(subject).to transition_from(:published).to(:draft).on_event(:draft)
      expect(subject).to allow_event :publish
    end
  end
end
