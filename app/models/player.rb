class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :beatles_playlist, class_name: "Game::BeatlesPlaylist"

  scope :ordered, -> { joins(:user).order("users.nickname ASC") }

  def beatles_playlist!
    beatles_playlist || create_beatles_playlist!
  end
end
