class TagsController < ApplicationController
  def new
    @tag = UsersTag.new
  end

  def create
    @tag = UsersTag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to action: :new
    else
      render :new
    end
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  def after_sign_up_new
    @tag = UsersTag.new
    @path = request.fullpath
  end

  def after_sign_up_create
    @tag = UsersTag.new(tag_params)
    @path = request.fullpath
    if @tag.valid?
      @tag.save
      redirect_to action: :after_sign_up_new
    else
      render :after_sign_up_new
    end
  end

  private

  def tag_params
    params.require(:users_tag).permit(:name).merge(user_id: current_user.id)
  end
end
