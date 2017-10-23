class Api::V1::ReceiptsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_receipt, only: %i[show update]
  def index
    respond_with Receipt.all
  end

  def show
    respond_with @receipt
  end

  def create
    respond_with :api, :v1, Receipt.create(receipt_params)
  end

  def destroy
    respond_with Receipt.destroy(params[:id])
  end

  def update
    @receipt.update_attributes(receipt_params)
    respond_with receipt, json: receipt
  end

  private

  def receipt_params
    params.require(:receipt).permit(:id, :name, :category)
  end

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end
end
