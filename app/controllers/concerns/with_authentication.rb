module WithAuthentication
  extend ActiveSupport::Concern

  def authorize_user
    @current_user = AccessToken.authenticate(params[:access_token])
  end
end