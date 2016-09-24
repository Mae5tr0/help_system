# Paginates ActiveRecord scopes
#
# @example ActiveRecord
#
#   Paginator.new(Episode).paginate(limit: 10, offset: 100)
#
Paginator = Struct.new(:resources) do
  # @param limit [Fixnum] (50)
  # @param offset [Fixnum] (0)
  def paginate(limit: nil, offset: nil)
    limit, offset = parse_params(limit: limit, offset: offset)

    paginated_resources = resources.offset(offset).limit(limit)
    total_count = resources.count
    paginated_resources.define_singleton_method(:pagination) do
      {
        limit: limit,
        offset: offset,
        count: count,
        total_count: total_count
      }
    end

    paginated_resources
  end

  def parse_params(limit: nil, offset: nil)
    limit = limit.to_s == '' ? 50 : limit
    offset = offset.to_s == '' ? 0 : offset

    is_integer = /\A([1-9][0-9]*|0)\Z/

    if limit.to_s =~ is_integer && offset.to_s =~ is_integer
      return Integer(limit), Integer(offset)
    else
      # TODO @refactor
      fail BadRequestError.new('offset_and_limit_should_be_an_integers')
    end
  end
end
