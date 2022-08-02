class Batch < ApplicationRecord
  scope :names_alphabetically, -> { order(name: :asc) }

  has_many :memberships, class_name: "BatchMembership"
  has_many :members, through: :memberships, source: :user

  has_one :owner_membership, -> { role_owner }, class_name: "BatchMembership"
  has_one :owner, through: :owner_membership, source: :user

  before_validation :set_url_identifier, if: :new_record?

  validates :name, :location, presence: true
  validates :name, :url_identifier, uniqueness: true

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