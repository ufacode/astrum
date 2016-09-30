# frozen_string_literal: true
class Domain::Block::VideosController < Domain::Block::ApplicationController
  before_action :set_video

  private

  def set_video
    @blockable = Block::Video.find params[:id]
  end

  def blockable_params
    params.require(:block_video).permit(:video)
  end
end
