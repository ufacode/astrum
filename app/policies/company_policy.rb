# frozen_string_literal: true
class CompanyPolicy < ApplicationPolicy
  def edit?
    record && record&.owner == user
  end
end
