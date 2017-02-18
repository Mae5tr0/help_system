# Error for client errors (4xx)
BadRequestError = Class.new(ApplicationError)
BadRequestError.register_as :bad_request