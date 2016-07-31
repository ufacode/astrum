# frozen_string_literal: true
class CompanyPolicy < ApplicationPolicy
  def create?
    @user && @record&.owner == @user
  end
end
