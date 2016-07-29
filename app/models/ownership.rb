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
#  fk_rails_68282d75fa  (user_id => users.id)
#  fk_rails_a3ec7d6c5e  (company_id => companies.id)
#
