class RoomUserRelation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.room?(sign, current_user)
    sign.user.room_ids & current_user.room_ids
  end

  def self.room_title(user_ids, current_user)
    index = user_ids.index(user_ids.find_by(user_id: current_user.id))
    if index == 0
      user_ids[1].user
    else
      user_ids[0].user
    end
  end

  def self.talked_to_me(current_user)
    rooms = Room.where(id: current_user.room_ids).includes(:users)
    users = []
    rooms.each do |room|
      users << User.find(room.room_user_relations[1].user_id) if room.room_user_relations[0].user_id == current_user.id
    end
    users
  end

  def self.talked_room_id(another_user, current_user)
    another_user.room_ids & current_user.room_ids
  end

  def self.talked_users(current_user)
    elements = []
    users = []
    current_user.rooms.each do |room|
      index = room.users.index(current_user)
      created_at = if room.messages.present?
                     room.messages.reverse[0].created_at
                   else
                     room.created_at
                   end
      if index == 0
        elements << { user: room.users[1], created_at: created_at }
      elsif index == 1
        elements << { user: room.users[0], created_at: created_at }
      end
    end

    elements.sort_by { |e| e[:created_at] }.reverse.each do |element|
      users << element[:user]
    end
    users
  end
end
