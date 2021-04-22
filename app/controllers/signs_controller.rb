class SignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sign_params, only: [:show, :edit, :update, :destroy]
  before_action :set_keywords, only: [:search_result, :show]

  def index
    @signs = Sign.match_signs(current_user)
    @users = RoomUserRelation.talked_to_me(current_user)
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
    @talk_room = RoomUserRelation.room?(@sign, current_user)
  end

  def destroy
    @sign.destroy if current_user.id == @sign.user_id
    redirect_to my_signs_signs_path
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  def search_index
  end

  def search_result
    @results = if @keywords.present?
                 Sign.search(@keywords, current_user)
               else
                 []
               end
  end

  def my_signs
    @signs = Sign.where(user_id: current_user.id).includes(:user).reverse
  end

  def match_signs
    @signs = Sign.match_signs(current_user)
  end

  private

  def sign_params
    params.require(:signs_tag).permit(:text, names: []).merge(user_id: current_user.id)
  end

  def sign_update_params
    params.require(:sign).permit(:text, names: []).merge(user_id: current_user.id)
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
