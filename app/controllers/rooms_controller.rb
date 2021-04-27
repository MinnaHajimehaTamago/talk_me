class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = RoomUserRelation.talked_users(current_user)
  end

  def create
    @sign = Sign.find(params[:format])
    @room = Room.create(user_ids: [@sign.user.id, current_user.id])
    redirect_to room_messages_path(room_id: @room.id)
  end

  def talk_rooms
    @users = RoomUserRelation.talked_to_me(current_user)
  end
end
