class Users::AvatarComponent < ViewComponent::Base
  def initialize(user, size: 4)
    @user = user
    @size = size
  end

  def call
    image_tag @user.image_url, class: "rounded-full"
  end
end
