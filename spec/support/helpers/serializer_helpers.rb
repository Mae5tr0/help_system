module SerializerHelpers
  def render_json(model)
    ActiveModelSerializers::SerializableResource.new(model || object).to_json
  end
end
