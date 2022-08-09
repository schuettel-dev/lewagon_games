class Batches::UsersTableComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include HeroiconHelper

  attr_reader :batch

  def initialize(batch:)
    @batch = batch
  end

  def to_dom_id
    "#{dom_id(batch)}__users_table_component"
  end
end