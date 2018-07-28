# frozen_string_literal: true

RSpec.describe CompanyPolicy do
  subject { described_class }
  let(:company) { FactoryBot.create(:company) }
  let(:owner) { company.owner }
  let(:guest) { FactoryBot.create(:user) }

  permissions :create?, :new? do
    it 'nil user can`t create a new Company' do
      expect(subject).not_to permit(nil, Company.new)
    end

    it 'User can create a new Company' do
      expect(subject).to permit(FactoryBot.create(:user), Company.new)
    end
  end

  permissions :edit?, :update?, :destroy? do
    it 'access granted if is User is Owner' do
      expect(subject).to permit(owner, company)
    end

    it 'denied access if User is not Owner' do
      expect(subject).not_to permit(guest, company)
    end
  end
end
