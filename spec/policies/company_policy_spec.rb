# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CompanyPolicy do
  subject { CompanyPolicy }

  permissions :create?, :update?, :destroy?, :edit? do
    user1 = User.new
    user2 = User.new
    company = Company.new
    company.users << user1

    it 'denied access if is not user' do
      expect(subject).not_to permit(nil, Company.new)
    end

    it 'access granted if is user' do
      expect(subject).to permit(user1, company)
    end

    it 'denied access if is other user' do
      expect(subject).not_to permit(user2, company)
    end
  end
end
