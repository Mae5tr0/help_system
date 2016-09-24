class UsersController < ApplicationController
  def index
    # authorize! :index, :user
    # @users = User.all
    #
    render json: User.all
  end

  def show

  end

  def edit

  end

  def create

  end


  def authorize

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end