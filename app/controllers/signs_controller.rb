class SignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sign_params, only: [:show, :edit, :update, :destroy]
  before_action :set_keywords, only: [:search_result, :show]

  def index
    @signs = Sign.match_signs(current_user)
    @users = RoomUserRelation.talked_to_me(current_user)
    # @signs_to_myselfs = Sign.to_myself(current_user)
    # @signs_to_myselfs_kana = Sign.to_myself_kana(current_user)
    # if current_user.spot.present?
    #   @match_state_signs = Sign.match_state_signs(current_user)
    #   @match_city_signs = Sign.match_city_signs(current_user)
    # end
    # @favorited_signs = Sign.favorited_signs(current_user)
  end

  def new
    @sign = SignsTag.new
  end

  def create
    @sign = SignsTag.new(sign_params)
    if @sign.valid?
      @sign.save
      redirect_to signs_path
    else
      render :new
    end
  end

  def show
    @room = Room.new
    @favorite = Favorite.new
    @favorites = @sign.favorites.includes(:user)
    @viewer_favorite = @favorites.find { |f| f[:user_id] == current_user.id }
    @talk_room = RoomUserRelation.room?(@sign, current_user)
  end

  def edit
    redirect_to signs_path unless current_user.id == @sign.user_id
  end

  def update
    if @sign.update(sign_params)
      redirect_to sign_path(@sign.id)
    else
      render :edit
    end
  end

  def destroy
    @sign.destroy if current_user.id == @sign.user_id
    redirect_to user_path(current_user.id)
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def search_index
  end

  def search_result
    if @keywords.present?
      @results = Sign.search(@keywords)
    else
      @results = []
    end
  end

  private

  def sign_params
    params.require(:signs_tag).permit(:text, names: []).merge(user_id: current_user.id)
  end

  def set_sign_params
    @sign = Sign.find(params[:id])
  end

  def set_keywords
    if params[:search_tag].present?
      @keywords = params.require(:search_tag).permit(names: [])
    elsif params[:names].present?
      @keywords = params.permit(names: [])
    end
  end
end
