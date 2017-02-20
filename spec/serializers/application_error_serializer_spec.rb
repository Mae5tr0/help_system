RSpec.describe ApplicationErrorSerializer, type: :serializer do
  it 'default format' do
    expect(render_json(NotFoundError.new(:not_found))).to match_json_schema('_error')
  end

  it 'bad request error can contain additional information' do
    error = begin
      Ticket.new.validate!
    rescue ActiveRecord::RecordInvalid => e
      ValidationError.new(e)
    end

    expect(render_json(error)).to match_json_schema('_error')
  end
end
