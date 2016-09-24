class User < ActiveModel::Serializer
  include WithSerializedUid

  attributes :email
end
