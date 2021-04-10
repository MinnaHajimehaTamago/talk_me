class UserTagRelation < ApplicationRecord
  
  belongs_to :user
  belongs_to :tag
  
  def self.id?(current_user, tag_id)
    user_tag_relation = UserTagRelation.find_by(user_id: current_user.id, tag_id: tag_id)
    return user_tag_relation.id
  end

  def self.registered_tags(sign_id)
    
  end
end
