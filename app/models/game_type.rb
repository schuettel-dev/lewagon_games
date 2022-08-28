class GameType < ApplicationRecord
  has_many :games

  validates :name, :description, :instance_type, presence: true
  validates :name, uniqueness: true
  validates :instance_type, uniqueness: true
end
