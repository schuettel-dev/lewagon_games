class Game::BeatlePlaylist < ApplicationRecord
  TRACK_COLUMNS = [:track_1_url, :track_2_url, :track_3_url].freeze

  delegate :game, to: :player
  belongs_to :player

  def spotify_embed_url(attribute)
    song_link = attributes[attribute.to_s]
    spotify_song_id = String(song_link).split("spotify.com/track/")&.dig(1)&.split("?")&.dig(0)

    return unless spotify_song_id.present?

    "https://open.spotify.com/embed/track/#{spotify_song_id}?utm_source=generator"
  end

  def given_tracks_count
    TRACK_COLUMNS.count { spotify_embed_url(_1).present? }
  end

  def any_valid_links?
    TRACK_COLUMNS.any? { spotify_embed_url(_1).present? }
  end
end
