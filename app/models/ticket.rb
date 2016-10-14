class Ticket < ActiveRecord::Base
  include AASM
  include WithUid

  aasm column: :status do
    state :open, :initial => true
    state :closed

    event :close do
      transitions :from => :open, :to => :closed
    end
  end

  validates :title, :content, :user_id, presence: true

  belongs_to :user

  class << self
    def search(condition)
      where('title like ?', "%#{condition}%")
    end
  end
end
