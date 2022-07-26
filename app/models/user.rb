class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[github]

  has_many :batch_memberships
  has_many :batches, through: :batch_memberships

  scope :nicknames_alphabetically, -> { order(nickname: :asc) }
  scope :github_users, -> { where(provider: :github) }

  def self.find_by_github_uid(uid)
    github_users.find_by(uid:)
  end
end
