module Api
  module V1
    class UsersController < ApiController
      def index
        respond_with @users
      end

      def show
        respond_with @user
      end
    end
  end
end
