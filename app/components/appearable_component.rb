class AppearableComponent < ApplicationComponent
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end
