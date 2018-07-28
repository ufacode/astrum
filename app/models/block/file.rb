# frozen_string_literal: true

class Block::File < ApplicationRecord
  has_one :block, as: :blockable, inverse_of: :blockable, dependent: :destroy
end
# == Schema Information
#
# Table name: block_files
#
#  id         :integer          not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# rubocop:enable
