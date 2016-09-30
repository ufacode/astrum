# frozen_string_literal: true
class Domain::Block::PhotosController < Domain::Block::ApplicationController
  before_action :set_photo

  private

  def set_photo
    @blockable = Block::Photo.find params[:id]
  end

  def blockable_params
    params.require(:block_photo).permit(:photo)
  end
end
