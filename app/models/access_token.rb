class AccessToken < ActiveRecord::Base
  validates :token, presence: true
end
