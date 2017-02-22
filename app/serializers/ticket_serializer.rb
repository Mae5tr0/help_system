class TicketSerializer < ActiveModel::Serializer
  include WithSerializedUid
  has_one :user

  attributes :title, :content, :status
end
