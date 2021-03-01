class SignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sign_params, only: [:show, :edit, :update, :destroy]
  before_action :set_keywords, only: [:search_result, :show]
  # before_action :search_sign, only: [:search_index ,:search_result]

  def index
    @signs_to_myselfs = Sign.to_myself(current_user)
    @signs_to_myselfs_kana = Sign.to_myself_kana(current_user)
    if current_user.spot.present?
      @match_state_signs = Sign.match_state_signs(current_user)
      @match_city_signs = Sign.match_city_signs(current_user)
    end
    @favorited_signs = Sign.favorited_signs(current_user)
  end

  def new
    @sign = Sign.new
  end

  def create
    @sign = Sign.new(sign_params)
    if @sign.valid?
      @sign.save
      redirect_to signs_path
    else
      render :new
    end
  end

  def show
    show_check_peep
    @favorite = Favorite.new
    @favorites = @sign.favorites.includes(:user)
    @viewer_favorite = @favorites.find { |f| f[:user_id] == current_user.id }
  end

  def edit
    unless current_user.id == @sign.user_id
      redirect_to signs_path
    end
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

  def search_index
    @signs = Sign.to_myself(current_user)
  end

  def search_result
    @results = Sign.search(@keywords, current_user)
    # @results = @q.result.includes(:user)
    # @q = {q: params[:q].permit!}
  end

  private

  def sign_params
    params.require(:sign).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :city, :spot_type_id, :position_id, :characteristic_id, :content_id).merge(user_id: current_user.id)
  end

  def set_sign_params
    @sign = Sign.find(params[:id])
  end

  def set_keywords
    @keywords = {first_name: params[:first_name], last_name: params[:last_name], first_name_kana: params[:first_name_kana], last_name_kana: params[:last_name_kana], state_id: params[:state_id], city: params[:city]}
    if @keywords ==  {:first_name=>nil, :last_name=>nil, :first_name_kana=>nil, :last_name_kana=>nil, :state_id=>nil, :city=>nil}
      @keywords = {}
    end
  end

  def show_check_peep
    if @sign.user.id == current_user.id
      return
    end
    unless (current_user.personal_information.first_name == @sign.first_name && current_user.personal_information.last_name == @sign.last_name) || (current_user.personal_information.first_name_kana == @sign.first_name_kana && current_user.personal_information.last_name_kana == @sign.last_name_kana)
      redirect_to search_index_signs_path
    end
  end
  # def search_sign
  #   @q = Sign.ransack(params[:q])
  # end

end
