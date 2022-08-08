class Batches::AddUserFormComponent < ViewComponent::Base
  include HeroiconHelper

  def initialize(batch:, **params)
    @batch = batch
    @params = params
  end

  def user_searched?
    !found_users.is_a?(Array)
  end

  def found_users
    @found_users ||= search_users || []
  end

  def users_search_query
    @params[:users_search_query].presence
  end

  private

  def search_users
    return if users_search_query.blank?

    User.search(users_search_query)
        .without(@batch.users)
        .nicknames_alphabetically
        .limit(10)
  end
end
