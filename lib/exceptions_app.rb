class ExceptionsApp < ActionDispatch::PublicExceptions
  def call(env)
    @env = env
    @request = ActionDispatch::Request.new(env)

    render(status, Mime::JSON, body)
  end

  private

  def http_status
    200
  end

  def body
    {
        meta: {
            error_type: exception.message_id,
            error_message: exception.message,
        }
    }
  end

  def error_message

  end

  def exception
    @env['action_dispatch.exception']
  end

  def status
    @env['PATH_INFO'][1..-1]
  end
end