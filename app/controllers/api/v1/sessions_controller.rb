module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        user_password = session_params[:password]
        user_email = session_params[:email]
        user = user_email.present? && User.find_by(email: user_email)

        fail UnauthorizedError, :invalid_credentials unless user.valid_password? user_password

        sign_in user, store: false
        token = AccessToken.for(user)
        render json: token
      end

      def destroy
        AccessToken.find_by_token(params[:id]).revoke!
        head :no_content
      end

      def session_params
        params.require(:session).permit(:password, :email)
      end
    end
  end
end