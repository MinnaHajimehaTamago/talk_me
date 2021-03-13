class Tag < ApplicationRecord
  has_many :user_tag_relations
  has_many :users, through: :user_tag_relations

  validates :name, presence: true
end
