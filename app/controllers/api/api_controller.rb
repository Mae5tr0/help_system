require 'application_responder'

module Api
  class ApiController < ApplicationController
    self.responder = ApplicationResponder
    respond_to :json

    include Authenticable
    include CanCan::ControllerAdditions

    load_resource find_by: :uid
    load_and_authorize_resource only: [:index, :show, :create, :update, :destroy]

    rescue_from CanCan::AccessDenied do
      raise UnauthorizedError, :insufficient_privileges
    end

    def index
      render :index
    end
  end
end

