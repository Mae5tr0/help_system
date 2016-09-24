# Client should be authorized to perform such request
#
UnauthorizedError = Class.new(ApplicationError)
UnauthorizedError.register_as :unauthorized
