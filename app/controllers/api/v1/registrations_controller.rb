module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      def create
        user = User.new(params.permit(:email, :password))
        user.role = User::Role::CUSTOMER

        fail BadRequestError, :invalid_params, user.errors.full_messages.join(',') unless user.save

        render json: user, serializer: TokenSerializer
      end
    end
  end
end