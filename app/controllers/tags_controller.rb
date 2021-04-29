class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_administrator, only: [:index, :update]
  
  def index
    @tags = Tag.all
  end
  
  def new
    if session["tag_create_errors"].present?
      @errors = session["tag_create_errors"].dup
      session["tag_create_errors"].clear
    end
    @tag = UsersTag.new
  end

  def create
    @tag = UsersTag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to action: :new
    else
      session["tag_create_errors"] = @tag.errors.full_messages
      redirect_to new_tag_path
    end
  end

  def edit
  end

  def update
    tag = Tag.find(params[:id])
    id  = if tag.officiality_id == 0
            1
          else
            0
          end
    tag.update(officiality_id: id)
    redirect_to tags_path
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  def after_sign_up_new
    if session["tag_create_errors"].present?
      @errors = session["tag_create_errors"].dup
      session["tag_create_errors"].clear
    end
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
      session["tag_create_errors"] = @tag.errors.full_messages
      redirect_to  after_sign_up_new_tags_path
    end
  end

  private

  def tag_params
    params.require(:users_tag).permit(:name).merge(user_id: current_user.id)
  end

  def only_administrator
    redirect_to signs_path unless current_user.id == 1
  end
end
