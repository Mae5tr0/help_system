# Ticket model, represent user's issues
#
# @!attribute title
#   @return [String] The name of the issue.

# @!attribute content
#   @return [String] The description of the issue.

# @!attribute status
#   @return [String] Current issuer status.
#
# @!attribute uid
#   @return [String] Ticket uuid.
#
# @!attribute user
#   @return [User] Which user belongs to.
class Ticket < ActiveRecord::Base
  include AASM
  include WithUid

  aasm column: :status do
    state :opened, initial: true
    state :closed

    event :close do
      transitions from: :opened, to: :closed
    end
  end

  validates :title, :content, :user_id, presence: true

  belongs_to :user

  class << self
    # Search tickets by title
    # @param title [String] ticket's title
    #
    # @return [ActiveRecord::Relation] relation with founded tickets
    #
    # @example Find tickets where title contain a "problem"
    #   Ticket.search('problem')
    #
    def search(title)
      where('title like ?', "%#{title}%")
    end
  end
end
