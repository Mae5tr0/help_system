class TicketSerializer < ActiveModel::Serializer
  include WithSerializedUid

  attributes :title, :content, :status
end
