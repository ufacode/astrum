# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    # @TODO: check user banned? etc...
    user.present?
  end

  def create?
    new?
  end

  def edit?
    record.present?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
