class Game::BeatleDecorator < GameDecorator
  TRANSLATIONS = {
    initialized: {
      state: "Initialized",
      state_info_for_admin: "Only you can access the game for now. Make it public to to open it for the players.",
      button_text_to_move_to_next_state: "Make public",
      class_name_for_button_to_move_to_next_state: "small-white-button"
    },
    in_preparation: {
      state: "In preparation",
      state_info_for_admin: "Players can modify their tracks now. Only start the game if enough tracks exists to play.",
      button_text_to_move_to_next_state: "Start game",
      class_name_for_button_to_move_to_next_state: "small-green-button"
    },
    started: {
      state: "Started",
      state_info_for_admin: "Players can guess each others playlists. End the game to see the results, but wait until everybody has cast their votes.", # rubocop:disable Layout/LineLength
      button_text_to_move_to_next_state: "End game",
      class_name_for_button_to_move_to_next_state: "small-white-dangerous-button"
    },
    ended: {
      state: "Ended",
      state_info_for_admin: "",
      button_text_to_move_to_next_state: "",
      class_name_for_button_to_move_to_next_state: ""
    }
  }.freeze

  def display_state
    TRANSLATIONS.dig(state.to_sym, :state)
  end

  def display_state_info_for_admin
    TRANSLATIONS.dig(state.to_sym, :state_info_for_admin)
  end

  def display_button_text_to_move_to_next_state
    TRANSLATIONS.dig(state.to_sym, :button_text_to_move_to_next_state)
  end

  def class_name_for_button_to_move_to_next_state
    TRANSLATIONS.dig(state.to_sym, :class_name_for_button_to_move_to_next_state)
  end
end
