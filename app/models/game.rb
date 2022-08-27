class Game < ApplicationRecord
  belongs_to :game_type
  belongs_to :user

  has_many :players
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }
  scope :ordered, -> { in_order_of(:state, states.keys) }

  enum state: {
    initialized: "initialized",
    in_preparation: "in_preparation",
    started: "started",
    ended: "ended"
  }

  def beatles_playlist_for_user(user)
    players.find_by(user:).beatles_playlist!
  end
end
