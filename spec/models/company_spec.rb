# frozen_string_literal: true

RSpec.describe Company, type: :model do
  subject { FactoryBot.build(:company) }

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

    it 'check unique for domain' do
      subject.domain = 'astrum'
      subject.save
      subject2 = Company.new(name: 'Same name', domain: 'astrum')
      expect { subject2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'with soft-delete' do
    it { is_expected.to have_db_column(:deleted_at) }
    it { is_expected.to have_db_index(:deleted_at) }
    it { expect(described_class.all.where_sql).to include '"deleted_at" IS NULL' }
  end

  describe '#owner' do
    it 'return first User' do
      subject.save
      expect(subject.owner).to eq Ownership.where(company: subject).first.user
    end
  end
end
