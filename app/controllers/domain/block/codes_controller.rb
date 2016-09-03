# frozen_string_literal: true
class Domain::Blocks::CodesController < Domain::ApplicationController
  before_action :set_block_code, only: [:edit, :update]

  def edit; end

  def update
    if @block_code.update(block_code_params)
      redirect_to course_lecture_path(@block_code.block.lecture.course, @block_code.block.lecture),
                  notice: 'Code was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_block_code
    @block_code = Block.find(params[:block_id]).blockable
  end

  def block_code_params
    params.require(:block_code).permit(:content, :language)
  end
end
