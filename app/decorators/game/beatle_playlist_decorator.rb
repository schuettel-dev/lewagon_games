class Game::BeatlePlaylistDecorator < ApplicationDecorator
  include ActionView::Helpers::TagHelper

  def spotify_iframe(track)
    src = spotify_embed_url(track)

    return "invalid URL (#{attributes[track.to_s]})" if src.nil?

    tag.iframe src:, class: "rounded-lg", width: "100%", height: "80", frameBorder: 0, allowfullscreen: "", allow: "autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
  end

  def display_state
    case game.state
    when "in_preparation"
      display_in_preparation_states
    when "started"
      display_started_states
    when "ended"
      display_ended_states
    end
  end

  private

  def display_in_preparation_states
    return "Ready" if given_tracks_count == track_columns_count

    I18n.t("game.beatles.missing_tracks", count: track_columns_count - given_tracks_count)
  end

  def display_started_states
    "TODO display_started_states"
  end

  def display_ended_states
    "TODO display_ended_states"
  end

  def track_columns_count
    @track_columns_count ||= __getobj__.class::TRACK_COLUMNS.count
  end
end
