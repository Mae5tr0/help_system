module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      def create
        user = User.new(params.permit(:email, :password))
        user.role = User::Role::CUSTOMER

        # TODO @refactor to another error
        # user.validate!
        fail BadRequestError, :invalid_params, user.errors.full_messages.first unless user.save

        render json: ''
      end
    end
  end
end