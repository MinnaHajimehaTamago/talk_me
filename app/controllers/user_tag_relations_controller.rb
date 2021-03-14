class UserTagRelationsController < ApplicationController
  def destroy
    user_tag = UserTagRelation.find(params[:id])
    user_tag.destroy
    redirect_to new_tag_path
  end
end
