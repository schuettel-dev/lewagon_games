class Game::BeatlePlaylistGuessDecorator < ApplicationDecorator
  def display_guessing_player_guessed_player
    "#{guessing_player.decorate.display_user_name} guessed #{guessed_player.decorate.display_user_name}"
  end
end
