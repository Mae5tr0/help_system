class UserSerializer < ActiveModel::Serializer
  include WithSerializedUid

  attributes :email
end
