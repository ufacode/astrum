# frozen_string_literal: true
class MainController < Main::ApplicationController
  layout 'main/main'

  def index
    return redirect_to courses_path if request.subdomains.any?
  end
end
