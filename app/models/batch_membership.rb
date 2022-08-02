class BatchMembership < ApplicationRecord
  belongs_to :batch
  belongs_to :user

  enum role: {
    owner: "owner",
    teacher: "teacher",
    student: "student"
  }, _prefix: "role"

  validates :user_id, uniqueness: { scope: :batch_id }
  validate :single_owner, if: :role_owner?

  scope :nicknames_alphabetically, -> { joins(:user).order("users.nickname ASC") }

  private

  def single_owner
    return if BatchMembership.role_owner.without(self).find_by(batch:).nil?

    errors.add(:role, :can_only_exist_once)
  end
end
