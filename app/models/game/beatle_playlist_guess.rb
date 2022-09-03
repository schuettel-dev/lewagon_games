class Game::BeatlePlaylistGuess < ApplicationRecord
  belongs_to :guessing_player, class_name: "Player"
  belongs_to :guessing_game_beatle_playlist, class_name: "Game::BeatlePlaylist"
  belongs_to :guessed_player, optional: true, class_name: "Player"

  validates :points, numericality: { only_integer: true }, allow_blank: true
  validate :guessed_playlist_does_not_belong_to_guessing_player

  scope :for_game, ->(game) { where(guessing_player: Player.for_game(game)) }
  scope :for_user, ->(user) { where(guessing_player: Player.for_user(user)) }
  # scope :for_game_and_user, -> (game:, user:) { for_game(game).for_user(user) }
  scope :ordered, -> { order(id: :asc) }

  def guessed?
    guessed_player.present?
  end

  def compute_points!
    update!(points: guessed_right? ? 1 : 0)
  end

  def guessed_right?
    guessed_player == guessing_game_beatle_playlist.player
  end

  private

  def guessed_playlist_does_not_belong_to_guessing_player
    return if guessing_game_beatle_playlist.player != guessing_player

    errors.add(:guessing_player_id, "cannot guess their own playlist")
  end
end
