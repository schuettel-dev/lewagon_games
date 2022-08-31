class Game::BeatlePolicy < GamePolicy
  def show_own_playlist?
    !record.initialized?
  end
end
