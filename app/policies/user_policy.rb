class UserPolicy < ApplicationPolicy
  def index?
    any_admin?
  end

  def show?
    record == user || any_admin?
  end

  def create?
    any_admin?
  end

  def update?
    not_self? && any_admin?
  end

  def update_privilege?
    not_self? && user.privilege_superadmin?
  end

  def destroy?
    not_self? && any_admin?
  end

  def not_self?
    record != user
  end

  def add_to_batch?
    any_admin?
  end

  class Scope < Scope
    def resolve
      return scope if user.any_admin?

      scope.where(id: user.id)
    end
  end
end
