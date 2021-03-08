class FavoritesController < ApplicationController
  before_action :set_keywords

  def create
    favorite = Favorite.create(user_id: current_user.id, sign_id: params[:sign_id])
    redirect_to sign_path(favorite.sign_id, @keywords)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to sign_path(favorite.sign_id, @keywords)
  end

  private

  def set_keywords
    @keywords = { first_name: params[:first_name], last_name: params[:last_name], first_name_kana: params[:first_name_kana],
                  last_name_kana: params[:last_name_kana], state_id: params[:state_id], city: params[:city] }
  end
end
