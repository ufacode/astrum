# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CompanyPolicy do
  subject { CompanyPolicy }

  permissions :create?, :update?, :destroy? do
    it 'denied access if is not user' do
      expect(subject).not_to permit(nil, Company.new)
    end

    it 'access granted if is user' do
      expect(subject).to permit(User.new, Company.new)
    end
  end
end
