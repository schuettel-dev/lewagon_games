class Batches::AddMemberDialogComponent < ApplicationComponent
  attr_reader :batch, :search_query

  renders_one :add_button, -> { Batches::AddMemberButtonComponent.new(batch:) }
  renders_one :search_users, -> { Batches::SearchUsersComponent.new(batch:, search_query:) }

  def initialize(batch:, search_query: nil)
    @batch = batch
    @search_query = search_query
  end

  def render?
    policy(batch).add_membership?
  end

  def to_dom_id
    :batches__add_member_dialog_component
  end

  def call
    turbo_frame_tag(to_dom_id) do
      content
    end
  end
end
