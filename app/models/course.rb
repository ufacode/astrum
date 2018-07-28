# frozen_string_literal: true

class Course < ApplicationRecord
  include AASM

  belongs_to :company
  has_many :lectures, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :company, presence: true

  aasm do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :draft do
      transitions from: :published, to: :draft
    end
  end
end

# == Schema Information
#
# Table name: courses
#
#  aasm_state :string(16)
#  company_id :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_courses_on_aasm_state  (aasm_state)
#  index_courses_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
