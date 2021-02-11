class SignsController < ApplicationController
  before_action :authenticate_user!
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
    if params[:q].present?
      @q = {q: params[:q].permit!}
    end
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
    @keywords = params
    @results = Sign.search(@keywords, current_user)
    
    # @results = @q.result.includes(:user)
    # @q = {q: params[:q].permit!}
  end

  private

  def sign_params
    params.require(:sign).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :city, :spot_type_id, :position_id, :characteristic_id, :content_id).merge(user_id: current_user.id)
  end

  # def search_sign
  #   @q = Sign.ransack(params[:q])
  # end

end
