class PlayerDecorator < ApplicationDecorator
  def display_user_name
    user.decorate.display_name
  end

  def display_points
    points
  end

  def display_user_name_and_points
    "#{display_user_name} (#{display_points} points)"
  end

  def to_label
    display_user_name
  end
end
