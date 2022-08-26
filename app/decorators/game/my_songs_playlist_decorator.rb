class Game::MySongsPlaylistDecorator < ApplicationDecorator
  include ActionView::Helpers::TagHelper

  def spotify_iframe(track)
    src = spotify_embed_url(track)

    return "invalid URL (#{attributes[track.to_s]})" if src.nil?

    tag.iframe src:, class: "rounded-lg", width: "100%", height: "80", frameBorder: 0, allowfullscreen: "", allow: "autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
  end
end
