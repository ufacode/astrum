# frozen_string_literal: true
class BlockPolicy < ApplicationPolicy
  def edit?
    record && record.lecture&.course&.company&.owner == user
  end
end
