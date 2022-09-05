class FlashComponent < ApplicationComponent
  def render?
    signed_in? && flash.any?
  end
end
