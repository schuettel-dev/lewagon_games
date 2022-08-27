class GamePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.users.include?(user)
  end

  def update?
    admin?
  end

  def admin?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.having_user_as_player(user)
    end
  end
end
