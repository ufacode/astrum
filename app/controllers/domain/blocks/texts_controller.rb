# frozen_string_literal: true
class Domain::Blocks::TextsController < Domain::ApplicationController
  before_action :set_block_text, only: [:edit, :update]

  def edit; end

  def update
    if @block_text.update(block_text_params)
      redirect_to course_lecture_path(@block_text.block.lecture.course, @block_text.block.lecture),
                  notice: 'Text was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_block_text
    @block_text = Block.find(params[:block_id]).blockable
  end

  def block_text_params
    params.require(:block_text).permit(:content)
  end
end
