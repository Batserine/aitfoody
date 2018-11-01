class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    # redirect_to root_url
     redirect_to main_app.root_path, alert: exception.message
  end

end
