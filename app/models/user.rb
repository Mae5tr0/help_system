class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  # TODO @refactor
  module Role
    ADMIN = 'admin'.freeze
    SUPPORT_MANAGER = 'support'.freeze
    CUSTOMER = 'customer'.freeze
  end
  include WithUid
  has_many :tickets
end
