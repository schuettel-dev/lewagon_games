class Game < ApplicationRecord
  has_many :instances, class_name: "GameInstance"

  validates :name, :klass, presence: true
  validates :name, uniqueness: true
  validates :klass, uniqueness: true
end
