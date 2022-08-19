class Memberships::RemoveComponent < ApplicationComponent
  attr_reader :membership

  def initialize(membership:)
    @membership = membership
  end

  def render?
    policy(membership).maintain?
  end
end
