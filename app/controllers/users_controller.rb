class UsersController < ApplicationController
before_action :set_user_params

  def show
    @signs = @user.signs
    favorites = @user.favorites
    @favorite_signs = Sign.favorite_signs(favorites)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to aciton: :show
    else
      render action: :edit
    end
  end

  def edit_icon
  end

  def update_icon
    unless params[:user] == nil
      @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def set_user_params
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:image, :nickname, email: current_user.email, password: current_user.password, password_confirmation: current_user.password_confirmation)
  end
end
