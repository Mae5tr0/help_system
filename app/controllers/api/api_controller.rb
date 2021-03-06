module Api
  class ApiController < ApplicationController
    include Authenticable
    include ErrorHandling

    include Pundit
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index
  end
end
