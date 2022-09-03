class Game::BeatlePlaylistPolicy < ApplicationPolicy
  def update?
    record.game.in_preparation? && record.player.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
