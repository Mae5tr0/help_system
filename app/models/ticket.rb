class Ticket < ActiveRecord::Base
  module Status
    OPEN = 'open'.freeze
    CLOSED = 'closed'.freeze
  end

  validates :title, :content, :status, presence: true

  belongs_to :user
end
