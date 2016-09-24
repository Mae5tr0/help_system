module Authenticable
  # TODO @refactor
  def authorize_user
    @current_user = AccessToken.authenticate(params[:access_token])
  end

  def current_user
    @current_user
  end
end