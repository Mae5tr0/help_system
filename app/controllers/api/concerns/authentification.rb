module Authentification
  def current_user
    # @current_user ||= AccessToken.where(token: params[:access_token]).try(:user)
    @current_user ||= User.first
  end
end