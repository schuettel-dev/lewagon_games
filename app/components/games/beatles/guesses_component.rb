class Games::Beatles::GuessesComponent < ApplicationComponent
  attr_reader :game, :params

  def initialize(game:, params:)
    @game = game
    @params = params
    super()
  end

  def current_player
    @current_player ||= game.players.find_by(user: current_user)
  end

  def guesses
    @guesses ||= current_player.beatle_playlist_guesses.ordered
  end

  def current_guess
    guesses[current_guess_index]
  end

  private

  def current_guess_index
    params[:guess_page].to_i % guesses.count
  end
end
