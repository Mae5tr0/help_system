class Ability
  include CanCan::Ability

  def initialize(request_identity)

  end

  def default_rules
  end
end
