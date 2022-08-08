class CloseableButtonComponent < ViewComponent::Base
  include HeroiconHelper

  renders_one :opening_element

  attr_reader :closeable_after

  def initialize(closeable_after:)
    @closeable_after = closeable_after
  end
end
