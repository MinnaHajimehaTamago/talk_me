class SpotsController < ApplicationController
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
  end

  def update
  end

  def destroy
  end

  private

  def spot_params
    params.require(:spot).permit(:state_id, :city, :spot_type_id).merge(user_id: current_user.id)
  end

end
