class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :beatle_playlist, class_name: "Game::BeatlePlaylist"
  has_many :beatle_playlist_guesses, foreign_key: :guessing_player_id, class_name: "Game::BeatlePlaylistGuess"

  scope :for_game, -> (game) { where(game:) }
  scope :for_user, -> (user) { where(user:) }
  scope :ordered, -> { joins(:user).order("users.nickname ASC") }
end
