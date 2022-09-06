class Batches::AddMembershipComponent < ApplicationComponent
  attr_reader :membership

  delegate :batch, :user, to: :membership

  def initialize(batch: nil, user: nil)
    @membership = Membership.find_or_initialize_by(batch:, user:)
    super()
  end

  def render?
    policy(membership).maintain?
  end
end
