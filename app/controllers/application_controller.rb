class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate_user!

  def home
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end