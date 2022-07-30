class FlashComponent < ViewComponent::Base
  include Devise::Controllers::Helpers

  def render?
    signed_in? && flash.any?
  end
end
