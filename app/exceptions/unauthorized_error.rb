# Client should be authorized to perform such request
# Possible message_ids:
#   * client
#   * customer
#
UnauthorizedError = Class.new(ApplicationError)
UnauthorizedError.register_as :unauthorized
