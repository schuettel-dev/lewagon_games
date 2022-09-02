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

  def display_state_info_for_admin
    case state
    when "initialized"
      "Only you can access the game for now. Make it public to to open it for the players."
    when "in_preparation"
      "Players can modify their tracks now. Only start the game if enough tracks exists to play."
    when "started"
      "Players can guess each others playlists. End the game to see the results, but wait until everybody has cast their votes."
    end
  end

  def display_button_text_to_move_to_next_state
    case state
    when "initialized"
      "Make public"
    when "in_preparation"
      "Start game"
    when "started"
      "End game"
    end
  end

  def class_name_for_button_to_move_to_next_state
    case state
    when "initialized"
      "small-white-button"
    when "in_preparation"
      "small-green-button"
    when "started"
      "small-white-dangerous-button"
    end
  end
end
