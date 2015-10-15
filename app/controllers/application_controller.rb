class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  private

  def current_user
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def login_required(options = nil)
    current_user ? true : redirect_to(root_url)
  end

  helper_method :current_user

end
