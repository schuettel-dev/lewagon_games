class Game::BeatlePolicy < GamePolicy
  def show_own_playlist?
    record.in_preparation? && record.started?
  end
end
