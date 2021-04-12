class UsersController < ApplicationController
  before_action :set_user_params, except: :guest_sign_in

  def show
    
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = 'GUEST'
      user.password = 'guest2021'
      user.password_confirmation = 'guest2021'
    end
    sign_in user
    redirect_to signs_path
  end

  private

  def set_user_params
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:image, :nickname, email: current_user.email, password: current_user.password,
                                                    password_confirmation: current_user.password_confirmation)
  end
end
