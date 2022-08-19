class MembershipDecorator < ApplicationDecorator
  def display_role
    role.capitalize
  end

  def self.roles_as_options
    Membership.roles.without(:owner).keys.map { [_1.capitalize, _1] }
  end
end
