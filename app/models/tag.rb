class Tag < ApplicationRecord
  has_many :user_tag_relations
  has_many :users, through: :user_tag_relations
  has_many :signs, through: :sign_tag_relations

  validates :name, uniqueness: true, presence: true

end
