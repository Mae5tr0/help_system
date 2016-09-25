class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  include WithUid
  has_many :tickets
  has_many :access_tokens

  # TODO @refactor
  module Role
    ADMIN = 'admin'.freeze
    SUPPORT_MANAGER = 'support'.freeze
    CUSTOMER = 'customer'.freeze
    GUEST = 'guest'.freeze
  end

  def role?(check_role)
    role == check_role
  end

  class << self
    def guest
      new(role: Role::GUEST)
    end
  end

  # def admin?
  #   role == Role::ADMIN
  # end
  #
  # def manager?
  #   role == Role::SUPPORT_MANAGER
  # end
  #
  # def customer?
  #   role == Role::CUSTOMER
  # end
end
