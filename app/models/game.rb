class Game < ApplicationRecord
  belongs_to :game_type
  has_many :players
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }
  scope :ordered, -> { in_order_of(:state, states.keys) }

  enum state: {
    started: "started",
    ended: "ended"
  }

  def my_songs_playlist_for_user(user)
    players.find_by(user:).my_songs_playlist!
  end
end
