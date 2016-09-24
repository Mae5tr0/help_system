module WithUid
  extend ActiveSupport::Concern

  included do
    before_create :generate_uid
  end

  # @TODO @refactor
  def generate_uid
    self.uid = "#{self.class.name.downcase}_#{SecureRandom.uuid}"
  end
end