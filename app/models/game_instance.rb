class GameInstance < ApplicationRecord
  belongs_to :game
  has_many :players
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }

  enum state: {
    started: "started"
  }
end
