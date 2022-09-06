class Users::AvatarComponent < ApplicationComponent
  def initialize(user)
    @user = user
    super()
  end

  def call
    image_tag @user.image_url, class: "rounded-full"
  end
end
