module Users
  class CreateUserService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def perform
      user = User.new(email: @email, password: @password)
      user.role = User::Role::CUSTOMER

      raise BadRequestError, :invalid_params, user.errors.full_messages unless user.valid?
      user.save!
      user
    end
  end
end
