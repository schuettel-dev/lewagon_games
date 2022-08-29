class Game < ApplicationRecord
  belongs_to :game_type
  belongs_to :user

  has_many :players, dependent: :destroy
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }
  scope :ordered, -> { in_order_of(:state, states.keys) }

  enum state: {
    initialized: "initialized",
    in_preparation: "in_preparation",
    started: "started",
    ended: "ended"
  }

  def beatle_playlist_for_user(user)
    players.find_by(user:).beatle_playlist
  end
end
