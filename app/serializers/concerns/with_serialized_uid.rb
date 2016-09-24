module WithSerializedUid
  extend ActiveSupport::Concern

  included do
    attribute :id
  end

  def id
    object.uid
  end
end
