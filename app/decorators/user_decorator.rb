class UserDecorator < ApplicationDecorator
  def display_name
    name
  end

  def display_nickname
    nickname
  end

  def display_name_with_nickname
    "#{display_name} (#{display_nickname})"
  end

  def display_batches_count
    batches.size
  end
end
