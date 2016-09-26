require 'application_responder'

module Api
  class ApiController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :json

    include Authentification

    check_authorization
    load_resource find_by: :uid
    load_and_authorize_resource


    # TODO @refactor use in the same way error handling
    # rescue_from CanCan::AccessDenied do
    #   raise UnauthorizedError, :insufficient_privileges
    # end

    def index
      render :index
    end
  end
end
