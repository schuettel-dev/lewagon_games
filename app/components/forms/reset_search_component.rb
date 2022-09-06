class Forms::ResetSearchComponent < ApplicationComponent
  attr_reader :url

  def initialize(url:)
    @url = url
    super()
  end

  def render?
    params[:search_query].present?
  end
end
