class Ticket < ActiveRecord::Base
  # TODO @refactor
  module Status
    OPEN = 'open'.freeze
    CLOSED = 'closed'.freeze
  end

  validates :title, :content, :status, presence: true

  belongs_to :user
end
