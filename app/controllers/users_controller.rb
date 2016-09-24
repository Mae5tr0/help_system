class UsersController < ApplicationController
  before_action :authorize_user, only: [:index, :show, :edit]

  def index
    render json: paginate(User.all)
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