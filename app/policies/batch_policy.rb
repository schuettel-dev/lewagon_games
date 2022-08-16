class BatchPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    any_admin? || batch_member?
  end

  def create?
    any_admin?
  end

  def update?
    any_admin? || batch_owner?
  end

  def destroy?
    create?
  end

  def batch_owner?
    record.owner == user
  end

  def batch_member?
    record.users.include?(user)
  end

  def add_membership?
    update?
  end

  class Scope < Scope
    def resolve
      return scope if user.any_admin?

      scope.where(memberships: user.memberships)
    end
  end
end
