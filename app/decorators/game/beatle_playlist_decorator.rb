class Game::BeatlePlaylistDecorator < ApplicationDecorator
  include ActionView::Helpers::TagHelper

  def spotify_iframe(track)
    src = spotify_embed_url(track)

    return "invalid URL (#{attributes[track.to_s]})" if src.nil?

    tag.iframe src:, class: "rounded-lg", width: "100%", height: "80", frameBorder: 0, allowfullscreen: "", allow: "autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
  end

  def display_state
    return "Ready" if given_tracks_count == track_columns_count

    I18n.t("game.beatles.missing_tracks", count: track_columns_count - given_tracks_count)
  end

  private

  def track_columns_count
    @track_columns_count ||= __getobj__.class::TRACK_COLUMNS.count
  end
end
