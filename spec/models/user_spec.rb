# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

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

    it 'checks empty email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].any?).to be_truthy
    end

    it 'checks uniqueness of email' do
      create(:user, name: subject.name, email: subject.email, password: subject.password)
      subject.valid?
      expect(subject.errors[:email].any?).to be_truthy
    end
  end

  describe '#full_name' do
    it 'return name' do
      subject.valid?
      expect(subject.full_name).to eq subject.name
    end

    it 'return email if name is empty' do
      subject.name = nil
      subject.save(validation: false)
      expect(subject.full_name).to eq subject.email
    end
  end
end
