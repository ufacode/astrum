# frozen_string_literal: true
class Domain::CoursesController < Domain::ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authorize_it, only: [:edit, :update, :destroy]

  def index
    @courses = Course.where(company: current_company)
  end

  def show; end

  def new
    @course = current_company.courses.build
  end

  def edit; end

  def create
    @course = current_company.courses.build(course_params)

    if @course.save
      redirect_to course_path(@course), notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course), notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path(@company), notice: 'Course was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

  def authorize_it
    authorize @course
  end
end
