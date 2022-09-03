class Games::Beatles::PlaylistsController < ApplicationController
  before_action :set_playlist

  def update
    authorize @playlist

    @game = @playlist.game
    if @playlist.update(game_beatle_playlist_params)
      redirect_to @game
    else
      render "game/show"
    end
  end

  private

  def set_playlist
    game = policy_scope(Game).find(params[:game_id])
    @playlist = Game::BeatlePlaylist.for_game(game).find(params[:id])
  end

  def game_beatle_playlist_params
    params.require(:game_beatle_playlist).permit(:track_1_url, :track_2_url, :track_3_url)
  end
end
