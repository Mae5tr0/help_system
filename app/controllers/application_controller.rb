class ApplicationController < ActionController::Base
  include Authenticable
  include WithMeta
  include WithPagination

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
end
