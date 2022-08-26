class GamePolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.having_user_as_player(user)
    end
  end
end
