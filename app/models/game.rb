class Game < ApplicationRecord
  belongs_to :game_type
  has_many :players
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }

  enum state: {
    started: "started"
  }
end
