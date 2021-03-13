class Tag < ApplicationRecord
  has_many :user_tag_relations
  has_many :users, through: :user_tag_relations

  validates :name, uniqueness: true, presence: true

  def self.user_tags(user)
    user_tags = []
    user.user_tag_relations.each do |data|
      user_tags << Tag.find(data[:tag_id])
    end
    return user_tags.uniq
  end

end
