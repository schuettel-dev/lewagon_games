class Batches::UpdateMembershipComponent < ViewComponent::Base
  include Turbo::FramesHelper

  attr_reader :membership

  delegate :batch, to: :membership

  def initialize(membership:)
    @membership = membership
  end

  def to_dom_id
    dom_id(membership, :edit)
  end

  def css_classes
    class_names("select", "saved-animation": membership.role_previously_changed?)
  end
end
