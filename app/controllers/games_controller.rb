class GamesController < ApplicationController
  def index
    @games = policy_scope(Game).ordered
  end

  def show
    @game = policy_scope(Game).find(params[:id])
    @playlist = @game.my_songs_playlist_for_user(current_user)
  end
end
