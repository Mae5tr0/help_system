class TicketsController < ApplicationController
  before_action :authorize_user

  def index

  end

  def show

  end

  def edit

  end

  def create

  end

  def update

  end

  private

  def tickets_params
    params.require(:ticket).permit(:title, :content, :status)
  end
end