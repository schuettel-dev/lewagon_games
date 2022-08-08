class Users::BatchesTableComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include HeroiconHelper

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def to_dom_id
    "#{dom_id(user)}__batches_table_component"
  end
end
