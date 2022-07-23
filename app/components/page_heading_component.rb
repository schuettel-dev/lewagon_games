class PageHeadingComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :text, :icon

  def initialize(text, icon)
    @text = text
    @icon = icon
  end
end
