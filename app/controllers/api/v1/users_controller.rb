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
        @user.role = params[:role].downcase
        @user.save!

        head :no_content
      end

      # TODO really need?
      def profile
        # authorize! :show, current_user

        respond_with current_user
      end
    end
  end
end
