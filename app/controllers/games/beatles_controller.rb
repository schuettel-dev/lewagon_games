class Games::BeatlesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def show
    authorize @game
    @playlist = @game.beatle_playlist_for_user(current_user)
  end

  def update
    authorize @game
    @playlist = @game.beatle_playlist_for_user(current_user)

    if @game.update(game_params)
      redirect_to @game
    else
      render :show
    end
  end

  private

  def set_game
    @game = policy_scope(Game::Beatle).find(params[:game_id])
  end

  def game_params
    params.require(:game_beatle).permit(:state)
  end
end
