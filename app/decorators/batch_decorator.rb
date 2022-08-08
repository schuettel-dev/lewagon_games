class BatchDecorator < ApplicationDecorator
  def display_name_for_heading
    "Batch #{display_name}"
  end

  def display_name
    name
  end

  def display_location
    location
  end
end
