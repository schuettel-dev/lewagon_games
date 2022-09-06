class PagyComponent < ApplicationComponent
  include Pagy::Frontend

  def initialize(pagy:)
    @pagy = pagy
    super()
  end

  def render?
    @pagy.pages > 1
  end

  def call
    raw pagy_nav(@pagy) # rubocop:disable Rails/OutputSafety
  end
end
