class GameDecorator < ApplicationDecorator
  def display_id
    "##{id}"
  end

  def display_players_count
    players.size
  end

  def display_game_type
    game_type.decorate.display_name
  end

  def display_batch
    batch.decorate.display_name_and_location
  end
end
