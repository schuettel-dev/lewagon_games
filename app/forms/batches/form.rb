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
    object.assign_attributes(name:, location:)
    object.owner = current_user if object.new_record?

    super
  end

  def name
    batch_params[:name] || object.name
  end

  def location
    batch_params[:location] || object.location
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Batch")
  end

  def batch_params
    return {} unless params.key?(:batch)

    params.require(:batch).permit(:name, :location)
  end

  def cancel_path
    object
  end
end
