module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      include ErrorHandling

      def create
        @user = Users::CreateUserService.new(
          email: params[:email],
          password: params[:password]
        ).perform

        render json: @user, serializer: TokenSerializer
      end
    end
  end
end
