class Api::V1::PropertiesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_property, only: %i[show update full_property]

  def index
    user = User.find(params[:user_id]) if params[:user_id].to_i == current_user.id
    respond_with user.properties if user
  end

  def show
    respond_with @property
  end

  def full_property
    property = {
      property: @property,
      rooms: @property.rooms,
      items: @property.rooms.inject([]) do |items, room|
               items + room.items
             end
    }
    respond_with property
  end

  def create
    respond_with :api, :v1, Property.create(property_params)
  end

  def destroy
    respond_with Property.destroy(params[:id])
  end

  def update
    @property.update_attributes(property_params)
    respond_with property, json: property
  end

  private

  def property_params
    params.require(:property).permit(:id, :name, :street_address, :city, :state, :zip)
  end

  def user_params
    params.permit(:user_id)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
