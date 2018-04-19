# frozen_string_literal: true

class Block::Code < ApplicationRecord
  has_one :block, as: :blockable
end
