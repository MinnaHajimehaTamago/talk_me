class AppearancesController < ApplicationController
  
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
    @appearance = Appearance.find(current_user.appearance.id)
  end

  def update
    @appearance = Appearance.find(current_user.appearance.id)
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

end
