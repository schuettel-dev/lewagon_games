class GameDecorator < ApplicationDecorator
  def display_players_count
    players.size
  end
end
