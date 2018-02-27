class UsersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  before_action :set_user, only: [:edit, :update]

  def new
    redirect_to profile_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path, notice: 'Account successfully created'
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    if @user.update_attributes user_params
      redirect_to profile_path, notice: "Update successful"
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user)
          .permit(
            :first_name,
            :last_name,
            :username,
            :password,
            :password_confirmation
          )
  end
end
