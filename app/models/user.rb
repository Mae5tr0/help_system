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
  class Role
    ADMIN = 'admin'.freeze
    SUPPORT = 'support'.freeze
    CUSTOMER = 'customer'.freeze
  end

  devise :database_authenticatable, :registerable, :validatable

  include WithUid

  has_many :tickets, dependent: :destroy

  validates :auth_token, uniqueness: true
  validates :role, :email, presence: true
  validates :role, inclusion: { in: [Role::ADMIN, Role::CUSTOMER, Role::SUPPORT] }

  before_create :generate_auth_token!

  def generate_auth_token!
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
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
