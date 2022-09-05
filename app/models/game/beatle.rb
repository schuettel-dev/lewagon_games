class Game::Beatle < Game
  def finalize!
    self.class.transaction do
      compute_points_for_guesses!
      sum_up_points!
      compute_ranking!
    end
  end

  def compute_points_for_guesses!
    Game::BeatlePlaylistGuess.where(guessing_player: players).each(&:compute_points!)
  end

  def sum_up_points!
    players.each do |player|
      player.update!(points: Game::BeatlePlaylistGuess.where(guessing_player: player).sum(:points))
    end
  end

  def compute_ranking!
    players.distinct(:points).order(points: :desc).pluck(:points).each_with_index do |points, index|
      players.where(points:).update_all(rank: index + 1)
    end
  end
end
