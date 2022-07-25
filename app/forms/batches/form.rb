class Batches::Form < ApplicationForm
  def save
    object.assign_attributes(batch_params)

    super
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Admin::Batch")
  end

  def batch_params
    params.require(:admin_batch).permit(:name, :location)
  end
end
