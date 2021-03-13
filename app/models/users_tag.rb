class UsersTag

  include ActiveModel::Model
  attr_accessor :name, :user_id

  validates :name, presence: true

  def save
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    UserTagRelation.create(user_id: user_id, tag_id: tag.id)
  end

end