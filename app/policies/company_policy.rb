# frozen_string_literal: true
class CompanyPolicy < ApplicationPolicy
  def create?
    @user && @user.in?(@record.users)
  end

  def new?
    @user
  end

  def update?
    @user && @user == @record.users.first
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
