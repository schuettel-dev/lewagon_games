class Membership < ApplicationRecord
  belongs_to :batch
  belongs_to :user

  enum role: {
    student: "student",
    teacher: "teacher",
    owner: "owner"
  }, _prefix: "role"

  validates :user_id, uniqueness: { scope: :batch_id }
  validate :single_owner, if: :role_owner?

  scope :user_nicknames_alphabetically, -> { joins(:user).order("users.nickname ASC") }
  scope :batch_names_alphabetically, -> { joins(:batch).order("batches.name ASC") }

  private

  def single_owner
    return if Membership.role_owner.without(self).find_by(batch:).nil?

    errors.add(:role, :can_only_exist_once)
  end
end
