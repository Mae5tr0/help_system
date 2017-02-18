require 'application_responder'

module Api
  class ApiController < ApplicationController
    include Authenticable

    include Pundit
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    # TODO development dummy
    # rescue_from Pundit::NotAuthorizedError do
    #   raise UnauthorizedError, :insufficient_privileges
    # end

    # rescue_from AllowedParams::ValidationError do |exception|
    #   fail BadRequestError.new(:invalid_param, exception.message)
    # end

    decent_configuration do
      strategy DecentExposure::PunditAuthorizationStrategy
    end

    def index
      render :index
    end
  end
end

