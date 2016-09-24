class AccessTokenSerializer < ActiveModel::Serializer
  attributes :value

  def value
    object.token
  end
end
