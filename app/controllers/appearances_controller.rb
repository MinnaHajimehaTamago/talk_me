class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:edit, :update]
  
  def new
    @appearance = Appearance.new
  end

  def create
    @image = Appearance.appearance_image(appearance_params)
    @appearance = Appearance.new(appearance_params.merge(user_id: current_user.id, image: @image))
    if @appearance.save
      redirect_to edit_user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @image = Appearance.appearance_image(appearance_params)
    if @appearance.update(appearance_params.merge(user_id: current_user.id, image: @image))
      redirect_to edit_user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:hair_id, :eye_shape_id, :eye_size_id, :nose_shape_id, :nose_size_id, :mouth_shape_id, :mouth_size_id, :height_id, :body_shape_id, :gender_id)
  end

  def set_appearance
    @appearance = Appearance.find(current_user.appearance.id)
  end
end
