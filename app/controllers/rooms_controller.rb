class RoomsController < ApplicationController
  before_action :set_sign_params

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    
    if @room.valid?
      @room.save
      redirect_to room_messages_path(@room.id)
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, user_ids: [])
  end

  def set_sign_params
    @sign = Sign.find(params[:format])
  end
end
