class TagsController < ApplicationController
  def new
    @tag = UsersTag.new
  end

  def create
    @tag = UsersTag.new(tag_params)
    if @tag.valid?
      @tag.save
      return redirect_to edit_user_path(current_user.id)
    else
      render :new
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag}
  end

  private

  def tag_params
    params.require(:users_tag).permit(:name).merge(user_id: current_user.id)
  end

end
