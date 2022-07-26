class Batch < ApplicationRecord
  scope :names_alphabetically, -> { order(name: :asc) }

  has_many :memberships, class_name: "BatchMembership"
  has_many :members, through: :memberships, source: :user

  has_one :owner_membership, -> { role_owner }, class_name: "BatchMembership"
  has_one :owner, through: :owner_membership, source: :user

  validates :name, :location, presence: true

  def owner=(user)
    memberships.find_or_initialize_by(role: :owner).tap do |membership|
      membership.user = user if membership.new_record?
    end
  end
end
