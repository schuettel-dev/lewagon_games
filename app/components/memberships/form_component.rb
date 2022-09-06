class Memberships::FormComponent < ApplicationComponent
  attr_reader :form

  def initialize(form:)
    @form = form
    super()
  end

  def to_dom_id
    dom_id origin_object
  end

  private

  def already_user?
    membership.present?
  end

  def membership
    @membership ||= find_membership
  end

  def find_membership
    object.memberships.find_by(batch: @secondary)
  end
end
