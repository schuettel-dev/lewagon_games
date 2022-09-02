class Game::BeatlePlaylistGuessPolicy < ApplicationPolicy
  def update?
    record.guessing_player.in?(Player.for_user(user)) && game_started?
  end

  def game_started?
    record.guessing_player.game.started?
  end

  class Scope < Scope
    def resolve
      scope.for_user(user)
    end
  end
end
