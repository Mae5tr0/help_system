# For included models generate uid for
# new model and validate uniqueness for uid
module WithUid
  extend ActiveSupport::Concern

  included do
    before_create :generate_uid
    validates :uid, uniqueness: true
  end

  def generate_uid
    return if uid.present?
    loop do
      self.uid = "#{self.class.name.downcase}_#{SecureRandom.uuid}"
      break unless self.class.exists?(uid: uid)
    end
  end
end
