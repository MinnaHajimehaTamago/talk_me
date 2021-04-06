class RoomsController < ApplicationController

  def create
    @sign = Sign.find(params[:format])
    @room = Room.create(user_ids: [@sign.user.id, current_user.id])
    redirect_to room_messages_path(room_id: @room.id)
  end

end
