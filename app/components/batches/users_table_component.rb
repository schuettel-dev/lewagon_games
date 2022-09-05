class Batches::UsersTableComponent < ApplicationComponent
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end

  def to_dom_id
    dom_id(batch, :table)
  end
end
