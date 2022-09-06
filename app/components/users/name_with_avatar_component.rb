class Users::NameWithAvatarComponent < ApplicationComponent
  attr_reader :user

  delegate :display_name, to: :user

  def initialize(user:)
    @user = user.decorate
    super()
  end

  def display_nickname
    "(#{user.display_nickname})"
  end
end
