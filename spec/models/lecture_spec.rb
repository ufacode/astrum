# frozen_string_literal: true

RSpec.describe Lecture, type: :model do
  subject { FactoryBot.build(:lecture) }

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
    it 'course not to be nil' do
      subject.course = nil
      subject.valid?
      expect(subject.errors[:course].any?).to be_truthy
    end
  end

  context 'with soft-delete' do
    it { is_expected.to have_db_column(:deleted_at) }
    it { is_expected.to have_db_index(:deleted_at) }
    it { expect(described_class.all.where_sql).to include '"deleted_at" IS NULL' }
  end
end
