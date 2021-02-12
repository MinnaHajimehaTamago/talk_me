class FavoritesController < ApplicationController

  def create
    favorite = Favorite.create(user_id: current_user.id, sign_id: params[:sign_id])
    redirect_to sign_path(favorite.sign_id)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to sign_path(favorite.sign_id)
  end

end
