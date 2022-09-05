class Batch < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :games

  has_one :owner_membership, -> { role_owner }, class_name: "Membership"
  has_one :owner, through: :owner_membership, source: :user

  before_validation :set_url_identifier, if: :new_record?

  validates :name, :location, presence: true
  validates :name, :url_identifier, uniqueness: true

  scope :search, ->(query) {
    return none if query.blank?

    where("(UPPER(name) LIKE :query OR UPPER(location) LIKE :query)", query: "%#{query.upcase}%")
  }
  scope :ordered_by_name, -> { order(name: :asc) }

  def owner=(user)
    memberships.find_or_initialize_by(role: :owner).tap do |membership|
      membership.user = user if membership.new_record?
    end
  end

  def to_param
    url_identifier
  end

  private

  def set_url_identifier
    self.url_identifier = name.parameterize
  end
end
