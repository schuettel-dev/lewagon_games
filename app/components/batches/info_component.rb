class Batches::InfoComponent < ViewComponent::Base
  include Turbo::FramesHelper
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end

  def to_dom_id
    "#{dom_id(batch)}__info_component"
  end
end
