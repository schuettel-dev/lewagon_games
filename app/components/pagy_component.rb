class PagyComponent < ApplicationComponent
  include Pagy::Frontend

  def initialize(pagy:)
    @pagy = pagy
  end

  def render?
    @pagy.pages > 1
  end

  def call
    raw pagy_nav(@pagy)
  end
end
