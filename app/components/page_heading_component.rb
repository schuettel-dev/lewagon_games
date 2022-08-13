class PageHeadingComponent < ApplicationComponent
  attr_reader :text, :icon

  def initialize(text, icon)
    @text = text
    @icon = icon
  end
end
