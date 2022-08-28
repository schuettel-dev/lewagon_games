class Game::BeatlePlaylistPolicy < ApplicationPolicy
  def update?
    record.game.in_preparation?
  end
end
