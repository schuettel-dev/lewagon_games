class Batch < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, dependent: :destroy
  has_many :games, dependent: :destroy

  has_one :owner_membership, -> { role_owner }, class_name: "Membership", dependent: :destroy # rubocop:disable Rails/InverseOf
  has_one :owner, through: :owner_membership, source: :user, dependent: :destroy

  before_validation :set_url_identifier, if: :new_record?

  validates :name, :location, :owner, presence: true
  validates :name, :url_identifier, uniqueness: true

  scope :search, ->(query) {
    return none if query.blank?

    where("(UPPER(name) LIKE :query OR UPPER(location) LIKE :query)", query: "%#{query.upcase}%")
  }
  scope :ordered_by_name, -> { order(name: :asc) }

  def to_param
    url_identifier
  end

  private

  def set_url_identifier
    self.url_identifier = name&.parameterize
  end
end
