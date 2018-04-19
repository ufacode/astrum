# frozen_string_literal: true

class Domain::ApplicationController < ApplicationController
  layout 'domain/application'

  private

  def current_company
    @current_company ||= Company.find_by!(domain: request.env[:company_subdomain])
  end
  helper_method :current_company
end
