class BatchMembershipDecorator < ApplicationDecorator
  def display_role
    role.capitalize
  end
end
