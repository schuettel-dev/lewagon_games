class HeaderComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include HeroiconHelper

  def render?
    signed_in?
  end
end
