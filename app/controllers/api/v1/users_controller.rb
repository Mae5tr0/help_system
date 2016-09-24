module Api
  module V1
    class UsersController < ResourceController
      def resource_class
        User
      end

      def resource
        @user ||= User.find_by_uid(params[:id])
      end

      def resource_params
        params.require(:user).permit(:email, :password, :role)
      end
    end
  end
end
