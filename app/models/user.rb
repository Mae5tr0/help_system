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
  enum role: [ :admin, :support, :customer ]

  devise :database_authenticatable, :registerable, :validatable

  include WithUid

  has_many :tickets, dependent: :destroy

  validates :auth_token, uniqueness: true
  validates :email, presence: true

  before_create :generate_auth_token!
  before_validation :set_default_role

  def generate_auth_token!
    loop do
      self.auth_token = Devise.friendly_token
      break unless self.class.exists?(auth_token: auth_token)
    end
  end

  def set_default_role
    return if role.present?
    self.role = :customer
  end
end
