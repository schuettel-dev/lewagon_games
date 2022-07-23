class FlashComponent < ViewComponent::Base
  def render?
    flash.any?
  end
end
