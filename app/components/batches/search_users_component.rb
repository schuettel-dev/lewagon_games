class Batches::SearchUsersComponent < ApplicationComponent
  attr_reader :batch

  def initialize(batch:, **params)
    @batch = batch
    @params = params
    super()
  end

  def search_performed?
    !found_users.is_a?(Array)
  end

  def found_users
    @found_users ||= search_users || []
  end

  def search_query
    @params[:search_query].presence
  end

  def to_dom_id
    :batches__search_users_component
  end

  private

  def search_users
    return if search_query.blank?

    User.search(search_query)
        .without(@batch.users)
        .nicknames_alphabetically
        .limit(10)
  end
end
