module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        #TODO move to service
        user_password = session_params[:password]
        user_email = session_params[:email]
        user = user_email.present? && User.find_by(email: user_email)

        fail UnauthorizedError, :invalid_credentials unless user.present? && user.valid_password?(user_password)

        render json: user, serializer: TokenSerializer
      end

      def destroy
        current_user.generate_auth_token!
        current_user.save

        head :no_content
      end

      def session_params
        params.permit(:password, :email)
      end
    end
  end
end