class Games::Beatles::PlaylistGuessesController < ApplicationController
  before_action :set_game, only: :update

  def update
    beatle_playlist_guess = current_players_playlist_guesses_scope.find(params[:id])
    authorize beatle_playlist_guess

    guessed_player = @game.players.find_by(id: game_beatle_playlist_guess_params[:guessed_player_id])
    beatle_playlist_guess.update(guessed_player:)

    respond_to do |format|
      format.turbo_stream do
        @current_player = @game.players.find_by(user: current_user)
        @current_guess = beatle_playlist_guess
      end
      format.html do
        guess_page = current_players_playlist_guesses_scope.pluck(:id).index(beatle_playlist_guess.id)
        redirect_to game_beatle_path(@game, guess_page:)
      end
    end
  end

  private

  def game_beatle_playlist_guess_params
    params.require(:game_beatle_playlist_guess).permit(:guessed_player_id)
  end

  def set_game
    @game = policy_scope(Game).find(params[:game_id])
  end

  def current_players_playlist_guesses_scope
    policy_scope(Game::BeatlePlaylistGuess).for_game(@game).ordered
  end
end
