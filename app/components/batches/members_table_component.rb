class Batches::MembersTableComponent < ViewComponent::Base
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end
end
