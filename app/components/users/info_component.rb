class Users::InfoComponent < ViewComponent::Base
  include Turbo::FramesHelper

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def to_dom_id
    "#{dom_id(user)}__info_component"
  end
end
