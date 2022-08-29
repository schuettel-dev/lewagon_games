class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :beatle_playlist, class_name: "Game::BeatlePlaylist"

  scope :ordered, -> { joins(:user).order("users.nickname ASC") }

  # def beatle_playlist
  #   beatle_playlist || build_beatle_playlist
  # end
end
