class GameDecorator < ApplicationDecorator
  def display_players_count
    players.size
  end

  def display_state
    case state
    when "initialized"
      "Initialized"
    when "in_preparation"
      "In preparation"
    when "started"
      "Started"
    else
      "Ended"
    end
  end
end
