module Authenticable
  # TODO @refactor
  def authorize_user
    @current_user = AccessToken.authenticate(params[:access_token])
  end

  def current_user
    @current_user ||= AccessToken.where(token: params[:access_token]).try(:user)
  end
end