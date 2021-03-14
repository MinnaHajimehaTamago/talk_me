class AppearancesController < ApplicationController
  
  def new
    @appearance = Appearance.new
  end

  def create
    @image = "test"
    @appearance = Appearance.create(appearance_params)
    redirect_to edit_user_path(current_user.id)
  end

  def edit
  end

  def update
  end

  private

  def appearance_params
    params.require(:appearance).permit(:hair_id, :eye_shape_id, :eye_size_id, :nose_shape_id, :nose_size_id, :mouth_shape_id, :mouth_size_id, :height_id, :body_shape_id, :gender_id).merge(user_id: current_user.id, image: @image)
  end

end
