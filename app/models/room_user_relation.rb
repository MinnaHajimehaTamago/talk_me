class RoomUserRelation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.room?(sign, current_user)
    sign_rooms = []
    current_user_rooms = []
    sign.user.room_user_relations.each do |room|
      sign_rooms << room.room_id
    end
    current_user.room_user_relations.each do |room|
      current_user_rooms << room.room_id
    end
    return sign_rooms & current_user_rooms
  end

  def self.room_title(user_ids, current_user)
    index = user_ids.index(user_ids.find_by(user_id: current_user.id))
    if index == 0
      return user_ids[1].user
    else
      return user_ids[0].user
    end
  end
end
