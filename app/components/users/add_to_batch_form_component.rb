class Users::AddToBatchFormComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :user

  def initialize(user:, **params)
    @user = user
    @params = params
  end

  def batch_searched?
    !found_batches.is_a?(Array)
  end

  def found_batches
    @found_batches ||= search_batches || []
  end

  def batches_search_query
    @params[:batches_search_query].presence
  end

  private

  def search_batches
    return if batches_search_query.blank?

    Batch.search(batches_search_query)
         .without(@user.batches)
         .ordered_by_name
         .limit(10)
  end
end
