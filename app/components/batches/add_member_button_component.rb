class Batches::AddMemberButtonComponent < ApplicationComponent
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end

  def render?
    policy(batch).add_membership?
  end
end
