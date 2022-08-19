class Memberships::Form < ApplicationForm
  def initialize(batch: nil, user: nil, membership: nil, params: ActionController::Parameters.new)
    # @secondary = secondary
    # TODO FIXME
    super(primary, params)
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Membership")
  end
end
