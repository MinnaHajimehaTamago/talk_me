class SignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_keywords, only: [:search_result, :show]
  # before_action :search_sign, only: [:search_index ,:search_result]

  def index
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
    @sign = Sign.find(params[:id])
    show_check_peep
  end

  def edit
  end

  def update
  end

  def destroy
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

  def set_keywords
    @keywords = {first_name: params[:first_name], last_name: params[:last_name], first_name_kana: params[:first_name_kana], last_name_kana: params[:last_name_kana], state_id: params[:state_id], city: params[:city]}
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
