# Policy for user
# * User can see only himself
# * Admin and support can see all users
# * Users can update only admin
# * Support can see only see other support and users
#
class UserPolicy < ApplicationPolicy
  def show?
    return true if user.admin?
    return false if record.admin?
    return true if user.support?
    record.id == user.id
  end

  def update?
    return true if user.admin?
    false
  end

  class Scope < Scope
    def resolve
      return scope.all if user.admin?
      return scope.where.not(role: User::Role::ADMIN) if user.support?
      scope.where(id: user.id)
    end
  end
end
