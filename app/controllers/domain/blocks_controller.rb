# frozen_string_literal: true
class Domain::BlocksController < Domain::ApplicationController
  before_action :authenticate_user!
  before_action :set_lecture, only: :create
  before_action :set_block, only: [:edit, :update, :destroy]
  before_action :authorize_it, only: [:edit, :update, :destroy]

  def new
    @block = Block.new
  end

  def edit
  end

  def create
    @block = Lecture::CreateBlock.new(@lecture, find_block).perform
    authorize_it
  end

  def update
    if block_params[:order] == 'up'
      @block.move_higher
    else
      @block.move_lower
    end
    redirect_to course_lecture_path(@block.lecture.course, @block.lecture)
  end

  def destroy
    @lecture = @block.lecture
    @block.destroy
    redirect_to course_lecture_path(@lecture.course, @lecture), notice: 'Block was successfully destroyed.'
  end

  private

  def set_block
    @block = Block.find(params[:id])
  end

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def block_params
    params.permit(:order, keys: [:up, :down])
  end

  def find_block
    @type = params[:block]
  end

  def authorize_it
    authorize @block
  end
end
