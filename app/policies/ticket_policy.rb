class TicketPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    return true if user.admin? || user.support?
    record.user_id == user.id
  end

  def update?
    if record.opened?
      return true if record.user_id == user.id
      return true if user.support?
    end
    return true if user.admin?
    false
  end

  def delete?
    user.admin?
  end

  class Scope < Scope
    def resolve
      return scope if user.admin? || user.support?
      scope.where(user_id: user.id)
    end
  end
end
