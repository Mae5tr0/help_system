require 'application_responder'

module Api
  class ApiController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :json

    include Authenticable

    include Pundit
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    # rescue_from Pundit::NotAuthorizedError do
    #   raise UnauthorizedError, :insufficient_privileges
    # end

    decent_configuration do
      strategy DecentExposure::PunditAuthorizationStrategy
    end

    def index
      render :index
    end
  end
end

