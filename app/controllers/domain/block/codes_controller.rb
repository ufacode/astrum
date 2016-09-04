# frozen_string_literal: true
class Domain::Block::CodesController < Domain::Block::ApplicationController
  before_action :set_code

  private

  def set_code
    @blockable = Block::Code.find params[:id]
  end

  def blockable_params
    params.require(:block_code).permit(:content, :language)
  end
end
