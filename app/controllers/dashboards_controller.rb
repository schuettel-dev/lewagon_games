class DashboardsController < ApplicationController
  def show
    @games = policy_scope(Game)
  end
end
