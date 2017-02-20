module Users
  class CreateUserService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def perform
      User.create!(email: @email, password: @password)
    end
  end
end
