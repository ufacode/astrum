# frozen_string_literal: true

class Block::Text < ApplicationRecord
  has_one :block, as: :blockable, inverse_of: :blockable, dependent: :destroy
end
# == Schema Information
#
# Table name: block_texts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# rubocop:enable
