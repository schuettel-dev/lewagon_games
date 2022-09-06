class Games::Beatles::PlaylistComponent < ApplicationComponent
  attr_reader :playlist

  def initialize(playlist:)
    @playlist = playlist
    super()
  end
end
