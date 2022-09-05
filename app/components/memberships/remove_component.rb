class Memberships::RemoveComponent < ApplicationComponent
  attr_reader :membership

  def initialize(membership:, redirect_to_user: false)
    @membership = membership
    @redirect_to_user = redirect_to_user
  end

  def render?
    policy(membership).maintain?
  end

  def redirect_to_user?
    @redirect_to_user
  end
end
