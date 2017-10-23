class Api::V1::ItemsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_item, only: %i[show update]
  def index
    respond_with Item.all
  end

  def show
    respond_with @item
  end

  def create
    respond_with :api, :v1, Item.create(item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def update
    @item.update_attributes(item_params)
    respond_with item, json: item
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :category)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
