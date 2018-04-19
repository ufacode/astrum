# frozen_string_literal: true

class Lecture::CreateBlock
  def initialize(lecture, block)
    @lecture = lecture
    @block = "Block::#{block.camelize}".constantize
  end

  def perform
    @lecture.blocks.create(blockable: @block.new)
  end
end
