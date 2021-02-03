class SignsController < ApplicationController
  def index
  end

  def new
    @sign = Sign.new
  end

  def create
    @sign = Sign.new(sign_params)
    binding.pry
    if @sign.valid?
      @sign.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def sign_params
    params.require(:sign).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :city, :spot_type_id, :position_id, :characteristic_id, :content_id).merge(user_id: current_user.id)
  end

end
