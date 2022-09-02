class Game < ApplicationRecord
  belongs_to :game_type
  belongs_to :batch
  belongs_to :user

  has_many :players, dependent: :destroy
  has_many :users, through: :players

  scope :having_user_as_player, -> (user) { where(players: Player.where(user:)) }
  scope :ordered, -> { order(id: :desc) }

  enum state: {
    initialized: "initialized",
    in_preparation: "in_preparation",
    started: "started",
    ended: "ended"
  }

  def beatle_playlist_for_user(user)
    players.find_by(user:).beatle_playlist
  end

  def progress!
    return if next_state.nil?

    update(state: next_state)
  end

  def next_state
    game_states_keys = Game.states.keys
    next_states_index = game_states_keys.index(state).next
    game_states_keys[next_states_index]
  end
end
