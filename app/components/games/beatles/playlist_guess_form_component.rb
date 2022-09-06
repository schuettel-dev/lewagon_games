class Games::Beatles::PlaylistGuessFormComponent < ApplicationComponent
  attr_reader :current_player, :current_guess

  def initialize(current_player:, current_guess:)
    @current_player = current_player
    @current_guess = current_guess
    super()
  end

  def guesses
    current_player.beatle_playlist_guesses.eager_load(guessed_player: :user).ordered
  end

  def guessed
    guesses.find_all(&:guessed?)
  end

  def guessed_player_options
    game.players.excluding(current_player).map do |player|
      [to_label(player), player.id]
    end
  end

  private

  def game
    @game ||= current_guess.guessing_player.game
  end

  def guessed_player_ids_tallied
    guessed.map(&:guessed_player_id).tally
  end

  def to_label(player)
    [
      ("🔘" * guessed_player_ids_tallied[player.id].to_i).presence,
      player.decorate.to_label
    ].compact.join(" ")
  end
end
