# frozen_string_literal: true

class Company < ApplicationRecord
  acts_as_paranoid

  has_many :ownerships, dependent: :destroy
  has_many :users, through: :ownerships
  has_many :courses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :domain, uniqueness: { case_sensitive: false }

  def owner
    ownerships.first&.user
  end
end

# == Schema Information
#
# Table name: companies
#
#  created_at  :datetime         not null
#  deleted_at  :datetime
#  description :text
#  domain      :string
#  id          :integer          not null, primary key
#  name        :string           not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_companies_on_deleted_at  (deleted_at)
#  index_companies_on_domain      (domain) UNIQUE
#
