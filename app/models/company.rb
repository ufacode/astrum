# frozen_string_literal: true
class Company < ApplicationRecord
  has_many :ownerships
  has_many :users, through: :ownerships
  has_one :owner, -> { ownerships.first.user }, class_name: 'User'

  validates :name, presence: true, length: { maximum: 255 }

  acts_as_paranoid
end

# == Schema Information
#
# Table name: companies
#
#  created_at  :datetime         not null
#  deleted_at  :datetime
#  description :text(65535)
#  id          :integer          not null, primary key
#  name        :string(255)
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_companies_on_deleted_at  (deleted_at)
#
