class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:notice] = 'You are successfully logged in'
      redirect_to '/'
    else
      render 'new'
      flash[:alert] = 'Invalid username/password combination'
    end
  end

  def destroy
  end
end
