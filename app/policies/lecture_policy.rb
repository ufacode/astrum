# frozen_string_literal: true

class LecturePolicy < ApplicationPolicy
  def edit?
    record && record.course&.company&.owner == user
  end
end
