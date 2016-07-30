# frozen_string_literal: true
class CompanyPolicy < ApplicationPolicy
  def create?
    @user
  end

  def new?
    create?
  end

  def update?
    @user
  end

  def edit?
    update?
  end

  def destroy?
    @user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
