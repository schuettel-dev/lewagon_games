class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.having_user_as_player(user)
    end
  end
end
