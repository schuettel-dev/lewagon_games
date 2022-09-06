class Batches::InfoComponent < ApplicationComponent
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
    super()
  end

  def to_dom_id
    "#{dom_id(batch)}__info_component"
  end
end
