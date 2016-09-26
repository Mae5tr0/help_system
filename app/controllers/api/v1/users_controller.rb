module Api
  module V1
    class UsersController < ApiController
      def index
        respond_with @users
      end

      def show
        respond_with @user
      end

      def update
        @user.update(params.permit(:role))
        @user.save!

        head :no_content
      end
    end
  end
end
