class Games::Beatles::PlaylistsController < ApplicationController
  before_action :set_game
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    authorize @game, :show_playlist_index?
    @playlists = Game::BeatlePlaylist.for_game(@game).ordered_by_player
    current_playlist_id = params[:selected_playlist_id] || @game.beatle_playlist_for_user(current_user).id
    @current_playlist = @playlists.find_by(id: current_playlist_id)
  end

  def show
    authorize @playlist
  end

  def edit
    authorize @playlist
  end

  def update
    authorize @playlist

    if @playlist.update(game_beatle_playlist_params)
      redirect_to @game
    else
      render "game/show"
    end
  end

  private

  def set_game
    @game = policy_scope(Game).find(params[:game_id])
  end

  def set_playlist
    @playlist = Game::BeatlePlaylist.for_game(@game).find(params[:id])
  end

  def game_beatle_playlist_params
    params.require(:game_beatle_playlist).permit(:track_1_url, :track_2_url, :track_3_url)
  end
end
