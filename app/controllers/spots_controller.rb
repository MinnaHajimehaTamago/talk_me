class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spot_params, only: [:show, :edit, :update, :destroy]

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.valid?
      @spot.save
      redirect_to edit_user_path(current_user.id)
    else
      render action: :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @spot.user_id
  end

  def update
    if @spot.update(spot_params)
      redirect_to edit_user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:state_id, :city, :spot_type_id).merge(user_id: current_user.id)
  end

  def set_spot_params
    @spot = Spot.find(params[:id])
  end
end
