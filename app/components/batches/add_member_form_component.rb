class Batches::AddMemberFormComponent < ViewComponent::Base
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

  def user_search_query
    @params[:users_search_query].presence
  end

  private

  def search_users
    return if user_search_query.blank?

    User.search(user_search_query).nicknames_alphabetically.limit(10)
  end
end
