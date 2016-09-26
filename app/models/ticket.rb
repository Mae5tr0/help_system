class Ticket < ActiveRecord::Base
  # TODO @refactor
  module Status
    OPEN = 'open'.freeze
    CLOSED = 'closed'.freeze
  end
  include WithUid

  validates :title, :content, :status, :user_id, presence: true

  belongs_to :user

  before_validation :set_status

  def set_status
    self.status = Status::OPEN unless status.present?
  end

  class << self
    def search(titleString)
      where('title like ?', titleString)
    end
  end
end
