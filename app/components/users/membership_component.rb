# class Users::MembershipComponent < ApplicationComponent
#   attr_reader :user, :batch

#   def initialize(user:, batch:)
#     @user = user
#     @batch = batch
#   end

#   def render?
#     !membership&.role_owner? && policy(membership).maintain?
#   end

#   def to_dom_id
#     "#{dom_id(user)}__toggle_membership_component"
#   end

#   def already_user?
#     membership.present?
#   end

#   def membership
#     @membership ||= find_membership
#   end

#   private

#   def find_membership
#     user.memberships.find_by(batch:)
#   end
# end
