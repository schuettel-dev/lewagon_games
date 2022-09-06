class Forms::ErrorMessagesComponent < ApplicationComponent
  attr_reader :form, :field

  def initialize(form:, field:)
    @form = form
    @field = field
    super()
  end

  def render?
    form.errors.key?(field)
  end

  def call
    tag.div(messages, class: "field-with-error text-red-500")
  end

  def messages
    form.errors.messages_for(field).join(", ")
  end
end
