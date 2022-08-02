class DashboardsController < ApplicationController
  def show
    @count = session[:count].to_i
  end
end
