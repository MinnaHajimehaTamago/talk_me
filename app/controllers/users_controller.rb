class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @signs = @user.signs
  end
end
