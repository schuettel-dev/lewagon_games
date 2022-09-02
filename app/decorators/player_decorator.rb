class PlayerDecorator < ApplicationDecorator
  def display_user_name
    user.decorate.display_name
  end

  def to_label
    display_user_name
  end
end
