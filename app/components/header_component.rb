class HeaderComponent < ViewComponent::Base
  include Devise::Controllers::Helpers

  def render?
    signed_in?
  end
end
