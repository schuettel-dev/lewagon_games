class Batch < ApplicationRecord
  scope :names_alphabetically, -> { order(name: :asc) }
end
