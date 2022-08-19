class GameType < ApplicationRecord
  has_many :games

  validates :name, :klass, presence: true
  validates :name, uniqueness: true
  validates :klass, uniqueness: true
end
