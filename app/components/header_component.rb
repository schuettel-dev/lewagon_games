class HeaderComponent < ApplicationComponent
  def render?
    signed_in?
  end
end
