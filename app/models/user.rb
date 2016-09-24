class User < ActiveRecord::Base
  # TODO @refactor
  module Role
    ADMIN = 'admin'.freeze
    SUPPORT_MANAGER = 'support'.freeze
    CUSTOMER = 'customer'.freeze
  end

  validates :uid, :email, :password, :role, presence: true

  has_many :tickets
end
