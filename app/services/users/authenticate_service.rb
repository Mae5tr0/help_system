module Users
  class AuthenticateService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def perform
      user = User.find_by(email: @email)

      raise UnauthorizedError, :invalid_credentials unless user.present? && user.valid_password?(@password)
      user
    end
  end
end
