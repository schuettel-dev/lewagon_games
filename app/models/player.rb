class Player < ApplicationRecord
  belongs_to :game_instance
  belongs_to :user
end
