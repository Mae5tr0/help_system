# Policy for tickets
# * Ticket can create anyone
# * User can see only his tickets
# * Support and admin can view all tickets
# * User can updated only his opened ticket
# * Tickets can delete only admin
#
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

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      return scope.all if user.admin? || user.support?
      scope.where(user_id: user.id)
    end
  end
end
