class Batches::MembersTableComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end
end
