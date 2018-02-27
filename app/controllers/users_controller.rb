class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
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
