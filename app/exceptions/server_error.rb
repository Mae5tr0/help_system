# Server error
ServerError = Class.new(ApplicationError)
ServerError.register_as :internal_server_error
