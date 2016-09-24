module Api
  module WithPagination
    extend ActiveSupport::Concern

    def paginate(scope)
      Paginator.new(scope).paginate(
          limit: params[:limit],
          offset: params[:offset]
      )
    end

    # TODO @refactor
    def _render_option_json(resource, options)
      if paginated?(resource)
        super(resource, options.deep_merge(meta: { pagination: resource.pagination }))
      else
        super
      end
    end

    def _render_with_renderer_json(resource, options)
      if paginated?(resource)
        super(resource, options.deep_merge(meta: { pagination: resource.pagination }))
      else
        super
      end
    end

    private

    def paginated?(resource)
      resource.respond_to?(:pagination)
    end
  end
end
