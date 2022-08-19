class DashboardsController < ApplicationController
  def show
    @game_instances = policy_scope(GameInstance)
  end
end
