# frozen_string_literal: true

class Block::Video < ApplicationRecord
  has_one :block, as: :blockable
end
