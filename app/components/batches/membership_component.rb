# class Batches::MembershipComponent < ApplicationComponent
#   attr_reader :batch, :user

#   def initialize(batch:, user:)
#     @batch = batch
#     @user = user
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
#     batch.memberships.find_by(user:)
#   end
# end
