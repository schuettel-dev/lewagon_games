class Games::Beatles::PlaylistGuessesProgressBarComponent < ApplicationComponent
  attr_reader :current_player

  def initialize(current_player:)
    @current_player = current_player
  end

  def guesses
    @guesses ||= current_player.beatle_playlist_guesses
  end

  def guessed
    @guessed ||= guesses.find_all(&:guessed?)
  end

  def total_guesses
    guesses.count
  end

  delegate :count, to: :guessed, prefix: true

  def guessed_percentage
    guessed_count.positive? ? (guessed_count.to_f / total_guesses * 100.0) : 0
  end

  def text
    "#{guessed_count} of #{total_guesses} guessed"
  end

  def missing_guesses?
    guessed_percentage < 100
  end
end
