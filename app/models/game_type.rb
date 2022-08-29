class GameType < ApplicationRecord
  has_many :games

  validates :name, :description, :instance_type, presence: true
  validates :name, uniqueness: true
  validates :instance_type, uniqueness: true

  scope :ordered, -> { order(name: :asc) }

  def new_game(user:)
    instance_type.constantize.new(game_type: self, user:)
  end
end
