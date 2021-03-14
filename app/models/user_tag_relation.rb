class UserTagRelation < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :tag
  
end
