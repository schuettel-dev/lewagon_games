class Batches::Form < ApplicationForm
  attr_reader :current_user

  SUBMIT = {
    edit: {
      icon: "pencil",
      text: "Edit batch"
    },
    new: {
      icon: "plus-sm",
      text: "Add batch"
    }
  }.freeze

  def initialize(object, params = {}, current_user = nil)
    @current_user = current_user
    super(object, params)
  end

  def save
    object.assign_attributes(batch_params)
    object.owner = current_user if object.new_record?

    super
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Admin::Batch")
  end

  def batch_params
    params.require(:admin_batch).permit(:name, :location)
  end

  def cancel_path
    [:admin, object]
  end
end
