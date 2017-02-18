# User model, represent user in system
#
# @!attribute email
#   @return [String] user's email

# @!attribute password
#   @return [String] user's password (hash)

# @!attribute auth_token
#   @return [String] user's auth token
#
# @!attribute role
#   @return [String] user's role in system
#
# @!attribute tickets
#   @return [ActiveRecord::Relation<Ticket>] user's tickets
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  include WithUid

  has_many :tickets, dependent: :destroy

  validates :auth_token, uniqueness: true

  before_create :generate_auth_token!

  # Generate token for new user
  def generate_auth_token!
    return if auth_token.present?
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

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
