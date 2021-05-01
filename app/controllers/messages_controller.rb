class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages
    @room_title = RoomUserRelation.room_title(@room.room_user_relations, current_user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      redirect_to room_messages_path(@room)
    end
  end

  def reload
    @room = Room.find(params[:room_id])
    messages = @room.messages.includes(:user)
    render json: { messages: messages }
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end
end
