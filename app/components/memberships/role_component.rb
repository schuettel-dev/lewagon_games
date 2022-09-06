class Memberships::RoleComponent < ApplicationComponent
  attr_reader :membership, :redirect_url

  def initialize(membership:, redirect_url:)
    @membership = membership
    @redirect_url = redirect_url
    super()
  end

  def to_dom_id
    dom_id(membership, :edit)
  end
end
