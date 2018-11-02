class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    # redirect_to root_url
     redirect_to main_app.root_path, alert: exception.message
  end


  def require_user
    redirect_to new_session_path unless current_user.id
  end
  before_action :set_paper_trail_whodunnit
end
