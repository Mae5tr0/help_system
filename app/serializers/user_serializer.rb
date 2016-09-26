class UserSerializer < ActiveModel::Serializer
  include WithSerializedUid

  attributes :email, :role
end
