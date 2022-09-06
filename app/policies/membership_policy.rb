class MembershipPolicy < ApplicationPolicy
  def update?
    maintain?
  end

  def destroy?
    maintain?
  end

  def maintain?
    not_batch_ownership? && (batch_owner? || any_admin?)
  end

  def batch_owner?
    record.batch.owner == user
  end

  def not_batch_ownership?
    !record.role_owner?
  end

  class Scope < Scope
    def resolve
      return scope if user.any_admin?

      user.memberships
    end
  end
end
