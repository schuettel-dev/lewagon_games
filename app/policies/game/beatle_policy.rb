class Game::BeatlePolicy < GamePolicy
  def show_playlist_index?
    record.ended?
  end

  def show_own_playlist?
    record.in_preparation? || record.started?
  end
end
