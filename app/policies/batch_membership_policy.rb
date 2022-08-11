class BatchMembershipPolicy < ApplicationPolicy
  def update?
    !record.role_owner? && (superadmin? || batch_owner?)
  end

  def batch_owner?
    record.batch.owner == user
  end
end
