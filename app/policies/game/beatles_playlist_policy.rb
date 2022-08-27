class Game::BeatlesPlaylistPolicy < ApplicationPolicy
  def update?
    record.game.in_preparation?
  end
end
