# frozen_string_literal: true
class Domain::LecturesController < Domain::ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :create, :edit]
  before_action :authorize_it, only: [:edit, :update, :destroy]

  def show; end

  def new
    @lecture = @course.lectures.build
  end

  def edit; end

  def create
    @lecture = @course.lectures.build(lecture_params)

    if @lecture.save
      redirect_to lecture_path(@lecture), notice: 'Lecture was successfully created.'
    else
      render :new
    end
  end

  def update
    if @lecture.update(lecture_params)
      redirect_to lecture_path(@lecture), notice: 'Lecture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lecture.destroy
    redirect_to course_path(@course), notice: 'Lecture was successfully destroyed.'
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def lecture_params
    params.require(:lecture).permit(:name, :course)
  end

  def authorize_it
    authorize @lecture
  end
end
