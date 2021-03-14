class UsersTag

  include ActiveModel::Model
  attr_accessor :name, :user_id

  validates :name, presence: true
  validate :user_tag_relation_uniqueness

  def save
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    UserTagRelation.create(user_id: user_id, tag_id: tag.id)
  end

  def user_tag_relation_uniqueness
    tag = Tag.where(name: name)
    if tag != [] && UserTagRelation.where(user_id: user_id, tag_id: tag[0][:id]).present?
      errors.add(:tag, "は既に登録済みです")
    end
  end

end