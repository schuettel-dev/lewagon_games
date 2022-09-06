class Users::InfoComponent < ApplicationComponent
  attr_reader :user

  def initialize(user:)
    @user = user
    super()
  end

  def to_dom_id
    "#{dom_id(user)}__info_component"
  end
end
