class Batch < ApplicationRecord
  scope :names_alphabetically, -> { order(name: :asc) }

  validates :name, :location, presence: true
end
