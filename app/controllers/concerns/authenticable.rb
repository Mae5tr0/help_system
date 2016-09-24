module Authenticable
  def current_user
    @current_user ||= AccessToken.find_by(token: request.headers['Authorization']).user
  end
end