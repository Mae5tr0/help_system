# Main class for all application errors
class ApplicationError < StandardError
  include ActiveModel::Serialization

  attr_reader :message_id, :message, :errors

  def initialize(message_id, message = nil, errors = [])
    @message_id = message_id.to_sym
    @message = message
    @errors = errors
  end

  def message
    @message.presence || I18n.t("exceptions.#{self.class.name.demodulize.underscore}.#{@message_id}")
  end

  def inspect
    "#<#{self.class.name}: #{message}, [#{@errors.map { |error| error[:message] }.join(', ')}]>"
  end

  def self.register_as(status)
    ActionDispatch::ExceptionWrapper.rescue_responses[name] = status
  end
end
