# frozen_string_literal: true

class Domain::Block::TextsController < Domain::Block::ApplicationController
  before_action :set_text

  private

  def set_text
    @blockable = Block::Text.find params[:id]
  end

  def blockable_params
    params.require(:block_text).permit(:content)
  end
end
