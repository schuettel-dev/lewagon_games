class Game::BeatlePlaylistPolicy < ApplicationPolicy
  def update?
    record.game.in_preparation?
  end

  class Scope < Scope
    def resolve
      scope.for_user(user)
    end
  end
end
