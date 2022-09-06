class Users::BatchesTableComponent < ApplicationComponent
  attr_reader :user

  def initialize(user:)
    @user = user
    super()
  end

  def to_dom_id
    "#{dom_id(user)}__batches_table_component"
  end
end
