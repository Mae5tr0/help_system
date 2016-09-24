class AccessToken < ActiveRecord::Base
  belongs_to :user

  before_create :set_token

  class << self
    def authenticate(access_token)
      fail UnauthorizedError, :empty_token if access_token.nil?
      token = find_by(token: access_token)
      fail UnauthorizedError, :invalid_token if token.nil? || token.user.nil?

      token.user
    end
  end

  def revoke!
    update!(revoked: true)
  end

  private

  def set_token
    self.token ||= SecureRandom.urlsafe_base64(48)
  end
end
