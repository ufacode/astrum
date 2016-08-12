# frozen_string_literal: true
class Block::Photo < ApplicationRecord
  has_one :block, as: :blockable
end
