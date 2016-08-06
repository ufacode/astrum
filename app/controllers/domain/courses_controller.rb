# frozen_string_literal: true
class Domain::CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:new, :create, :edit]
  before_action :authorize_it, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = @company.courses.build
  end

  def edit; end

  def create
    @course = @company.courses.build(course_params)

    if @course.save
      redirect_to company_course_path(@company, @course), notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to company_course_path(@course), notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company = @course.company
    @course.destroy
    redirect_to company_courses_path(@company), notice: 'Course was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

  def authorize_it
    authorize @course
  end
end
