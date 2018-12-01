class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to myProfile_path, notice: 'User profile was successfully updated.'
    else
      render "edit"
    end
  end
  # def update_password
  #   @user = current_user
  #   if @user.update(user_params)
  #     # Sign in the user by passing validation in case their password changed
  #     bypass_sign_in(@user)
  #     redirect_to root_path
  #   else
  #     render "edit"
  #   end
  # end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    # params.require(:user).permit(:password, :password_confirmation)
     params.require(:user).permit(:firstname, :lastname, :sex)
  end
end