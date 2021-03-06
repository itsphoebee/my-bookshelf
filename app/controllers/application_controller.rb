class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def must_be_admin
    return head(:forbidden) unless current_user && current_user.admin?
  end
end
