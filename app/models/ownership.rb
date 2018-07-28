# frozen_string_literal: true

class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :company
end

# == Schema Information
#
# Table name: ownerships
#
#  company_id :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_ownerships_on_company_id  (company_id)
#  index_ownerships_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
