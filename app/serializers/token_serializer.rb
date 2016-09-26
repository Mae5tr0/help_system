class TokenSerializer < ActiveModel::Serializer
  attributes :token

  def token
    object.auth_token
  end
end
