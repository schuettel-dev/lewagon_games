class Games::Beatles::PlayerProgressComponent < ApplicationComponent
  attr_reader :player

  renders_many :dots

  def initialize(player:)
    @player = player
    super()
  end

  def game
    @player.game
  end
end
