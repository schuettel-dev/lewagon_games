class Game::BeatlePlaylistGuess < ApplicationRecord
  belongs_to :guessing_player, class_name: "Player"
  belongs_to :guessed_game_beatle_playlist, class_name: "Game::BeatlePlaylist"
  belongs_to :guessed_player, optional: true, class_name: "Player"

  validates :sort_position, numericality: { only_integer: true, greater_than: 0 }
  validates :points, numericality: { only_integer: true }, allow_blank: true
  validate :guessed_playlist_does_not_belong_to_guessing_player

  private

  def guessed_playlist_does_not_belong_to_guessing_player
    return if guessed_game_beatle_playlist.player != guessing_player

    errors.add(:guessing_player_id, "cannot guess their own playlist")
  end
end
