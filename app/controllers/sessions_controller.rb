class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You are successfully logged in'
    else
      render 'new'
      flash[:alert] = 'Invalid username/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have been logged out'
  end
end
