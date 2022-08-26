class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_one :my_songs_playlist, class_name: "Game::MySongsPlaylist"

  scope :ordered, -> { joins(:user).order("users.nickname ASC") }

  def my_songs_playlist!
    my_songs_playlist || create_my_songs_playlist!
  end
end
