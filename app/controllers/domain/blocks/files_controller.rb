# frozen_string_literal: true
class Domain::Blocks::FilesController < Domain::ApplicationController
  before_action :set_block_file, only: [:edit, :update]

  def edit; end

  def update
    if @block_file.update(block_file_params)
      redirect_to course_lecture_path(@block_file.block.lecture.course, @block_file.block.lecture),
                  notice: 'File was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_block_file
    @block_file = Block.find(params[:block_id]).blockable
  end

  def block_file_params
    params.require(:block_file).permit(:file)
  end
end
