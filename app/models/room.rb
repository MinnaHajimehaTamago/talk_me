class Room < ApplicationRecord
  has_many :room_user_relations
  has_many :users, through: :room_user_relations, dependent: :destroy
  has_many :messages, dependent: :destroy

  def self.last_message(room_id)
    Message.where(room_id: room_id).reverse[0]
  end
end
