# frozen_string_literal: true
class Domain::Blocks::VideosController < Domain::ApplicationController
  before_action :set_block_videos, only: [:edit, :update]

  def edit; end

  def update
    if @block_videos.update(block_videos_params)
      redirect_to course_lecture_path(@block_videos.block.lecture.course, @block_videos.block.lecture),
                  notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_block_videos
    @block_videos = Block.find(params[:block_id]).blockable
  end

  def block_videos_params
    params.require(:block_video).permit(:video)
  end
end
