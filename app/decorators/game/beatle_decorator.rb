class Game::BeatleDecorator < GameDecorator
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
