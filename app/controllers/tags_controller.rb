class TagsController < ApplicationController
  def new
    @tag = UsersTag.new
    if params[:format] != nil
      @errors = params[:format]
    end
  end

  def create
    @tag = UsersTag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to action: :new
    else
      errors = @tag.errors.full_messages
      redirect_to new_tag_path(errors)
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
