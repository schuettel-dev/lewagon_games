class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :beatle_playlist, class_name: "Game::BeatlePlaylist", dependent: :destroy
  has_many :beatle_playlist_guesses,
           foreign_key: :guessing_player_id,
           class_name: "Game::BeatlePlaylistGuess",
           dependent: :destroy,
           inverse_of: :guessing_player

  scope :for_game, ->(game) { where(game:) }
  scope :for_user, ->(user) { where(user:) }
  scope :ordered_by_rank, -> { order(rank: :asc) }
  scope :ordered, -> { joins(:user).order("users.nickname ASC") }
end
