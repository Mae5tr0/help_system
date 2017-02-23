class ExceptionsApp < ActionDispatch::PublicExceptions
  def call(env)
    @env = env

    return super(env) unless exception.is_a?(ApplicationError)
    render(status, Mime::JSON, body)
  end

  def body
    ActiveModelSerializers::SerializableResource.new(exception).serializable_hash
  end

  private

  def exception
    @env['action_dispatch.exception']
  end

  def status
    @env['PATH_INFO'][1..-1]
  end
end
