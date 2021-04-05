class RoomUserRelation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.room_title(user_ids, current_user)
    index = user_ids.index(user_ids.find_by(user_id: current_user.id))
    if index == 0
      return user_ids[1].user
    else
      return user_ids[0].user
    end
  end
end
