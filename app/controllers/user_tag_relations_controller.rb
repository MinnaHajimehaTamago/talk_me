class UserTagRelationsController < ApplicationController
  def destroy
    user_tag = UserTagRelation.find(params[:id])
    user_tag.destroy
    if params[:path].present? && params[:path].include?('/tags/after_sign_up')
      redirect_to after_sign_up_new_tags_path
    else
      redirect_to new_tag_path
    end
  end
end
