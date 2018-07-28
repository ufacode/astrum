# frozen_string_literal: true

class Block::Code < ApplicationRecord
  has_one :block, as: :blockable, inverse_of: :blockable, dependent: :destroy
end
# == Schema Information
#
# Table name: block_codes
#
#  id         :integer          not null, primary key
#  content    :text
#  language   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# rubocop:enable
