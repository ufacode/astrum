# frozen_string_literal: true
class CoursePolicy < ApplicationPolicy
  def edit?
    record && record.company&.owner == user
  end
end
