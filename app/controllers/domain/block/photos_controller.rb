# frozen_string_literal: true
class Domain::Blocks::PhotosController < Domain::ApplicationController
  before_action :set_block_photos, only: [:edit, :update]

  def edit; end

  def update
    if @block_photos.update(block_photos_params)
      redirect_to course_lecture_path(@block_photos.block.lecture.course, @block_photos.block.lecture),
                  notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_block_photos
    @block_photos = Block.find(params[:block_id]).blockable
  end

  def block_photos_params
    params.require(:block_photo).permit(:photo)
  end
end
