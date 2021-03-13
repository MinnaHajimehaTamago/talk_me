class TagsController < ApplicationController
  def new
    @tag = UsersTag.new
  end

  def create
    @tag = UsersTag.new(tag_params)
    if @tag.valid?
      @tag.save
      return redirect_to signs_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:users_tag).permit(:name).merge(user_id: current_user.id)
  end

end
