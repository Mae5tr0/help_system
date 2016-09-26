module Authentification
  def current_user
    # @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    @current_user ||= User.first
  end
end