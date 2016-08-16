# frozen_string_literal: true
class Block::Text < ApplicationRecord
  has_one :block, as: :blockable
end
