class Game::BeatlePlaylist < ApplicationRecord
  TRACK_COLUMNS = [:track_1_url, :track_2_url, :track_3_url].freeze

  delegate :game, to: :player
  belongs_to :player
  has_many :beatle_playlist_guesses,
           foreign_key: :guessing_game_beatle_playlist_id,
           dependent: :destroy,
           inverse_of: :guessing_game_beatle_playlist

  scope :for_game, ->(game) { where(player: Player.for_game(game)) }
  scope :for_user, ->(user) { where(player: Player.for_user(user)) }
  scope :ordered_by_player, -> { joins(player: :user).order("users.nickname ASC") }

  def spotify_embed_url(attribute)
    song_id = spotify_song_id(attribute)
    return if song_id.nil?

    "https://open.spotify.com/embed/track/#{song_id}?utm_source=generator"
  end

  def spotify_song_id(attribute)
    String(attributes[attribute.to_s]).split("spotify.com/track/")&.dig(1)&.split("?")&.dig(0)
  end

  def given_tracks_count
    TRACK_COLUMNS.count { spotify_embed_url(_1).present? }
  end

  def any_valid_links?
    TRACK_COLUMNS.any? { spotify_embed_url(_1).present? }
  end
end
