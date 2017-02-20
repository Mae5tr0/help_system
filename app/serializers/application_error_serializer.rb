class ApplicationErrorSerializer < ActiveModel::Serializer
  attributes :message_id, :message, :errors
end
