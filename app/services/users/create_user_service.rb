module Users
  class CreateUserService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def perform
      User.create!(email: @email, password: @password)
    rescue ActiveRecord::RecordInvalid => e
      raise BadRequestError, e.message
    end
  end
end
