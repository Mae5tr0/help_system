module Api
  module V1
    class UsersController < ApiController
      expose :users
      expose :user, find_by: :uid

      def index
        render json: users
      end

      def show
        render json: user
      end

      def update
        @user.role = params[:role].downcase
        @user.save!

        head :no_content
      end

      # TODO really need?
      def profile
        render json: current_user
      end
    end
  end
end
