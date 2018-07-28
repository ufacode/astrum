# frozen_string_literal: true

class Main::CompaniesController < Main::ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_company, only: %i[edit update destroy]
  before_action :authorize_it, only: %i[edit update destroy]

  def index; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)
    @company.users << current_user
    authorize_it

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :domain)
  end

  def authorize_it
    authorize @company
  end
end
