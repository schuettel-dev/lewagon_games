class Users::SearchBatchesComponent < ApplicationComponent
  attr_reader :user

  def initialize(user:, **params)
    @user = user
    @params = params
  end

  def search_performed?
    !found_batches.is_a?(Array)
  end

  def found_batches
    @found_batches ||= search_batches || []
  end

  def search_query
    @params[:search_query].presence
  end

  private

  def search_batches
    return if search_query.blank?

    Batch.search(search_query)
         .without(@user.batches)
         .ordered_by_name
         .limit(10)
  end
end
