class GamesController < ApplicationController
  def index
    authorize Game
    @games = policy_scope(Game).ordered
  end
end
