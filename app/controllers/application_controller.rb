class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  def after_sign_in_path_for(user)
    wikis_path
  end
  def after_sign_up_path_for(resource)
    root_path
  end

  private
  def user_not_authorized
    flash[:alert] = "Access denied!"
    redirect_to (request.referrer || root_path)
  end

end
