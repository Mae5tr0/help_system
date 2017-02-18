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
    begin
      self.uid = "#{self.class.name.downcase}_#{SecureRandom.uuid}"
    end while self.class.exists?(uid: uid)
  end
end