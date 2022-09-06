class Game::BeatlePlaylistPolicy < ApplicationPolicy
  def show?
    update?
  end

  def edit?
    update?
  end

  def update?
    record.game.in_preparation? && record.player.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
