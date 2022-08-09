class Forms::ResetSearchComponent < ViewComponent::Base
  attr_reader :url

  def initialize(url:)
    @url = url
  end

  def render?
    params[:search_query].present?
  end
end
