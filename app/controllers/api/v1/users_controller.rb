class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update]
  def index
    respond_with User.all
  end

  def show
    respond_with @user
  end

  def create
    respond_with :api, :v1, User.create(user_params)
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

  def update
    @user.update_attributes(user_params)
    respond_with user, json: user
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
