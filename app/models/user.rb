class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  include WithUid
  has_many :tickets, dependent: :destroy

  validates :auth_token, uniqueness: true

  before_create :generate_auth_token!

  def generate_auth_token!
    return if auth_token.present?
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  # TODO generate checker methods
  class Role
    ADMIN = 'admin'.freeze
    SUPPORT = 'support'.freeze
    CUSTOMER = 'customer'.freeze
  end

  def admin?
    role == Role::ADMIN
  end

  def customer?
    role == Role::CUSTOMER
  end

  def support?
    role == Role::SUPPORT
  end
end
