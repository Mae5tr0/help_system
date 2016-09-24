module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      def create
        user = User.new(params.require(:user).permit(:email, :password))
        user.role = User::Role::CUSTOMER

        # TODO @refactor
        fail BadRequestError, :invalid_params, user.errors.full_messages.first unless user.save

        token = AccessToken.for(user)
        render json: token
      end
    end
  end
end