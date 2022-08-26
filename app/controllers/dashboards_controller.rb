class DashboardsController < ApplicationController
  def show
    @started_games = policy_scope(Game).eager_load(:players).eager_load(:game_type).started.ordered
    @ended_games_count = policy_scope(Game).ended.count
  end
end
