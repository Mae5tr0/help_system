module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError do
      raise UnauthorizedError, :insufficient_privileges
    end
    rescue_from ActiveRecord::RecordNotFound do
      raise NotFoundError, :not_fount
    end
    rescue_from ActiveRecord::RecordInvalid do |exception|
      fail BadRequestError.new(:invalid_param, exception.message)
    end
    # rescue_from ActiveRecord::ActiveRecordError do
    #   fail ServerError, :server_error
    # end
  end
end