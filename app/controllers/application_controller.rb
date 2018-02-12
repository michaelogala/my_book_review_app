class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user
  before_action :ensure_login

  protected

  def logged_in?
    session[:user_id].present?
  end

  def ensure_login
    redirect_to login_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
