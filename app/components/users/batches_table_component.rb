class Users::BatchesTableComponent < ViewComponent::Base
  include HeroiconHelper

  attr_reader :user

  def initialize(user:)
    @user = user
  end
end
