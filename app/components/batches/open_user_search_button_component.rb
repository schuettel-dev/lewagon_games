class Batches::OpenUserSearchButtonComponent < ApplicationComponent
  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end

  def render?
    policy(batch).add_membership?
  end

  def to_dom_id
    :batches__open_users_search_button_component
  end
end
