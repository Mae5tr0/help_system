module Api
  module V1
    class UsersController < ApplicationController
      def index
        respond_with paginate(@users)
      end

      def show
        respond_with @user
      end
    end
  end
end
