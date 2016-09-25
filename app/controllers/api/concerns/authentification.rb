module Authentification
  def current_user
    # @current_user ||= AccessToken.where(token: request.headers['Authorization']).try(:user)
    @current_user ||= User.first
  end
end