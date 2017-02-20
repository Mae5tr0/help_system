module Api
  module V1
    class SessionsController < Devise::SessionsController
      include Authenticable
      include ErrorHandling

      def create
        @user = Users::AuthenticateService.new(
          email: params[:email],
          password: params[:password]
        ).perform

        render json: @user, serializer: TokenSerializer
      end

      def destroy
        current_user.generate_auth_token!
        current_user.save

        head :no_content
      end

      protected

      def verify_signed_out_user
        # disable device before destroy action
      end
    end
  end
end
