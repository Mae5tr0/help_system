module Api
  module WithMeta
    # TODO @refactor
    def _render_option_json(resource, options)
      super(resource, options.deep_merge(meta: meta))
    end

    def _render_with_renderer_json(resource, options)
      super(resource, options.deep_merge(meta: meta))
    end

    private

    def meta
      {
          status: response.status
      }
    end
  end
end

