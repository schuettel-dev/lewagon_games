class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[github]

  has_many :batch_memberships
  has_many :batches, through: :batch_memberships

  scope :nicknames_alphabetically, -> { order(nickname: :asc) }
  scope :github_users, -> { where(provider: :github) }
  scope :search, ->(query) {
    return none if query.blank?

    where("(UPPER(nickname) LIKE :query OR UPPER(name) LIKE :query)", query: "%#{query.upcase}%")
  }

  def self.find_by_github_uid(uid)
    github_users.find_by(uid:)
  end
end
