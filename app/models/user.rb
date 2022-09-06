class User < ApplicationRecord
  include Privileges

  devise :omniauthable, omniauth_providers: %i[github]

  has_many :memberships, dependent: :destroy
  has_many :batches, through: :memberships

  scope :nicknames_alphabetically, -> { order(nickname: :asc) }
  scope :search, ->(query) {
    return none if query.blank?

    where("(UPPER(nickname) LIKE :query OR UPPER(name) LIKE :query)", query: "%#{query.upcase}%")
  }

  def to_param
    github_id
  end
end
