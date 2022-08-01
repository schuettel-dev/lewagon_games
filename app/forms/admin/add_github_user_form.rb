class Admin::AddGithubUserForm < ApplicationForm
  SUBMIT = {
    new: {
      icon: "plus-sm",
      text: "Add user"
    }
  }.freeze

  validates :github_nickname, presence: true
  validate :github_user_exists

  def save
    return unless valid?

    @object = User.github_users.find_or_initialize_by(uid: github_user.id).tap do |user|
      user.assign_attributes(github_user.to_user_params)
    end

    super
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Admin::User")
  end

  def user_params
    return {} unless params.key?(:admin_user)

    params.require(:admin_user).permit(:github_nickname)
  end

  def github_nickname
    user_params[:github_nickname]
  end

  def cancel_path
    [:admin, object]
  end

  private

  def github_user
    @github_user ||= GithubUserFinder.new(github_nickname).github_user
  end

  def github_user_exists
    return if github_nickname.blank?
    return if github_user.present?

    errors.add(:github_nickname, "GitHub user does not exist")
  end
end
