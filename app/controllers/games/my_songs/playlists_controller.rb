class Games::MySongs::PlaylistsController < ApplicationController
  before_action :set_playlist

  def update
    @game = @playlist.game
    if @playlist.update(game_my_songs_playlist_params)
      redirect_to @game
    else
      render "game/show"
    end
  end

  private

  def set_playlist
    game = Game.find_by!(id: params[:game_id])
    @playlist = game.my_songs_playlist_for_user(current_user)
  end

  def game_my_songs_playlist_params
    params.require(:game_my_songs_playlist).permit(:track_1, :track_2, :track_3)
  end
end
