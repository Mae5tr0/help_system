module Api
  module V1
    class UsersController < ApiController
      def index
        @users = policy_scope(User)
        render json: @users
      end

      def show
        authorize user
        render json: user
      end

      def update
        authorize user

        Users::ChangeRoleService.new(
          user: user,
          role: params[:role]
        ).perform

        head :no_content
      end

      private

      def user
        @user ||= User.find_by!(uid: params[:id])
      end
    end
  end
end
