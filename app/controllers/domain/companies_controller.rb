# frozen_string_literal: true
class Domain::CompaniesController < Domain::ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show]

  def index
    @company = Company.find_by_domain!(request.subdomain)
    @companies = Company.joins(:ownerships).where(ownerships: { user: @company.owner }) unless request.subdomain.empty?
  end

  def show; end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :domain)
  end
end
