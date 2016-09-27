class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    # @default || req.headers['Accept'].include?("application/vnd.marketplace.v#{@version}")
    request.format.html? && !(request.original_fullpath =~ /reports/)
  end
end