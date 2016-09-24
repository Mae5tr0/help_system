require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json

  include Authenticable
  include WithMeta
  include WithPagination

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :authorize_user
  check_authorization
  load_resource find_by: :uid
  load_and_authorize_resource


  # TODO @refactor use in the same way error handling
  # rescue_from CanCan::AccessDenied do
  #   raise UnauthorizedError, :insufficient_privileges
  # end
end
