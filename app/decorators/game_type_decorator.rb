class GameTypeDecorator < ApplicationDecorator
  def display_name
    name
  end

  def self.game_types_as_options
    GameType.ordered.map do |game_type|
      [
        "#{game_type.name} (#{game_type.description})",
        game_type.id
      ]
    end
  end
end
