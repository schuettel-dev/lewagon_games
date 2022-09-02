class Games::BeatlesController < ApplicationController
  before_action :set_and_authorize_game, only: [:show, :progress]

  def show
  end

  def progress
    @game.progress!
    redirect_to @game
  end

  private

  def set_and_authorize_game
    @game = policy_scope(Game::Beatle).find(params[:game_id])
    authorize @game
  end
end
