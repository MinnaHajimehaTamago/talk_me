class Room < ApplicationRecord
  has_many :room_user_relations
  has_many :users, through: :room_user_relations, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :title, presence: true
end
