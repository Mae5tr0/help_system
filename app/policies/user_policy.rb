class UserPolicy < ApplicationPolicy
  def show
    return true if user.admin? || user.support?
    record.user_id == user.id
  end

  def update?
    return true if user.admin?
    false
  end

  class Scope < Scope
    def resolve
      return scope if user.admin?
      return scope.where.not(role: User::Role::ADMIN) if user.support?
      scope.where(id: user.id)
    end
  end
end
