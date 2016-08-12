# frozen_string_literal: true
class Block::File < ApplicationRecord
  has_one :block, as: :blockable
end
