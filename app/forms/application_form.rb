class ApplicationForm
  include ActiveModel::Model

  attr_reader :object, :params

  delegate :id, :persisted?, :new_record?, :to_param, :user, to: :object

  SUBMIT_DEFAULTS = {
    edit: {
      icon: "pencil",
      text: "Edit"
    },
    new: {
      icon: "plus-sm",
      text: "Add"
    }
  }.freeze

  def initialize(object, params = ActionController::Parameters.new)
    @object = object
    @params = params
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, name.sub(/Form$/, ""))
  end

  def save
    object.save || merge_errors_and_return_false!(object)
  end

  def action
    return :new if object.new_record?

    :edit
  end

  def submit_icon
    self.class::SUBMIT.dig(action, :icon) || SUBMIT_DEFAULTS.dig(action, :icon)
  end

  def submit_text
    self.class::SUBMIT.dig(action, :text) || SUBMIT_DEFAULTS.dig(action, :text)
  end

  def cancel_path
    object
  end

  private

  def merge_errors_and_return_false!(other_object)
    errors.merge!(other_object.errors) && false
  end
end
