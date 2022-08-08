class Forms::SearchFormComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :url, :label_text

  def initialize(url:, label_text:)
    @url = url
    @label_text = label_text
  end
end
