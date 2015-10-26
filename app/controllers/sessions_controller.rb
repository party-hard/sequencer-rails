class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    #render text: request.env['omniauth.auth'].to_yaml and return
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      redirect_to auth_success_path + "?provider=#{@user.provider}&username=#{@user.name}"
    rescue
    redirect_to auth_failure_path + "?provider=#{params[:provider]}"
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    render status: 200, nothing: true
  end

  def auth_success
    render status: 200, nothing: true
  end

  def auth_failure
    render status: 404, nothing: true
  end
end
