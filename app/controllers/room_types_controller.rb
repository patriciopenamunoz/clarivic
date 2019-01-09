class RoomTypesController < ApplicationController
  def index
    @room_types = RoomType.where(hostel_id: params[:hostel_id])
  end

  def new
    @hostel = Hostel.find(params[:hostel_id])
    @room_type = RoomType.new
    respond_to do |format|
      format.js
    end
  end

  def create
    params[:room_type][:hostel_id] = params[:hostel_id]
    @room_type = RoomType.create(room_type_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def room_type_params
    params.require(:room_type).permit(%i[name description number_rooms
                                         occupied_rooms value_by_night
                                         hostel_id])
  end
end
