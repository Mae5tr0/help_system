# Error for invalid user inputs, can accepts ActiveRecord::RecordInvalid
# error and render it for convenient usage
class ValidationError < BadRequestError

  # @param exception [ActiveRecord::RecordInvalid]
  def initialize(exception)
    @error = exception.record.errors
    super(:invalid_params, nil, build_validation_errors)
  end

  private

  def build_validation_errors
    @error.map do |attribute, error|
      {
        attribute: attribute,
        message: @error.full_message(attribute, error)
      }
    end
  end
end
