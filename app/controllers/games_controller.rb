class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def index
    authorize Game
    @games = policy_scope(Game).ordered
  end

  def show
    authorize @game
    @playlist = @game.beatles_playlist_for_user(current_user)
  end

  def update
    authorize @game
    @playlist = @game.beatles_playlist_for_user(current_user)

    if @game.update(game_params)
      redirect_to @game
    else
      render :show
    end
  end

  private

  def set_game
    @game = policy_scope(Game).find(params[:id])
  end

  def game_params
    params.require(:game).permit(:state)
  end
end
