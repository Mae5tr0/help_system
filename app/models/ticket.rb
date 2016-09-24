class Ticket < ActiveRecord::Base
  # TODO @refactor
  module Status
    OPEN = 'open'.freeze
    CLOSED = 'closed'.freeze
  end
  include WithUid

  validates :title, :content, :status, presence: true

  belongs_to :user

  class << self
    def for(user)
      return user.tickets if user.role == User::Role::CUSTOMER
      Ticket.all
    end
  end
end
