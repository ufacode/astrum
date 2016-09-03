# frozen_string_literal: true
class Lecture < ApplicationRecord
  acts_as_paranoid

  belongs_to :course
  has_many :blocks, -> { order('position ASC') }

  validates :name, presence: true, length: { maximum: 255 }
  validates :course, presence: true

  def full_name
    "##{id}. #{name}"
  end
end

# == Schema Information
#
# Table name: lectures
#
#  course_id  :integer
#  created_at :datetime         not null
#  deleted_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lectures_on_course_id   (course_id)
#  index_lectures_on_deleted_at  (deleted_at)
#
