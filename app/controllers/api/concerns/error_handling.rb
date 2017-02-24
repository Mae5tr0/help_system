module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError do |error|
      raise UnauthorizedError, :invalid_token if error.message == 'must be logged in'
      raise UnauthorizedError, :insufficient_privileges
    end
    rescue_from ActiveRecord::RecordNotFound do
      raise NotFoundError, :not_found
    end
    rescue_from ActiveRecord::RecordInvalid do |exception|
      raise ValidationError.new(exception)
    end
  end
end
