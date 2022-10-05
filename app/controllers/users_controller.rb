class UsersController < BaseController
  before_action :find_user, only: %w[show]
  def index
    @users = User.all
    jsonapi_response(@users)
  end

  def show
    jsonapi_response(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
