module Api
  class BaseController < ActionController::Base
    include WithMeta
    include WithPagination
    # include WithErrorHandling
    # include WithAuthentication
  end
end
