class User < ActiveRecord::Base
  module Role
    ADMIN = 'admin'.freeze
    SUPPORT_MANAGER = 'support'.freeze
    CUSTOMER = 'customer'.freeze
  end

  validates :uid, :email, :password, :role, presence: true
end
