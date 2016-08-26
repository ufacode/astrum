# frozen_string_literal: true
class Domain::Block::TextsController < Domain::Block::ApplicationController
  before_action :set_text

  def edit; end

  def update
    render @text.update(text_params) ? :show : :edit
  end

  def show; end

  private

  def set_text
    @text = Block::Text.find params[:id]
  end

  def text_params
    params.require(:block_text).permit(:content)
  end
end
