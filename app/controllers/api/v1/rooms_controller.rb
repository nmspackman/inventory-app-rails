class Api::V1::RoomsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_room, only: %i[show update]
  def index
    respond_with Room.all
  end

  def show
    respond_with @room
  end

  def create
    respond_with :api, :v1, Room.create(room_params)
  end

  def destroy
    respond_with Room.destroy(params[:id])
  end

  def update
    @room.update_attributes(room_params)
    respond_with room, json: room
  end

  private

  def room_params
    params.require(:room).permit(:id, :name, :category)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
