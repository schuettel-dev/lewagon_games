class Batches::FormComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :form

  def initialize(form:)
    @form = form
  end

  def submit_button_text
    return "Add batch" if @form.object.new_record?

    "Edit batch"
  end
end
