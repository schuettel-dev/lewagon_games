class Games::Beatles::PlayerProgressComponent < ApplicationComponent
  attr_reader :player

  renders_many :dots

  def initialize(player:)
    @player = player
  end

  def game
    @player.game
  end
end
