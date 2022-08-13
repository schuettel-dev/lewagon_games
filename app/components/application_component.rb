class ApplicationComponent < ViewComponent::Base
  include Devise::Controllers::Helpers
  include HeroiconHelper
  include Turbo::FramesHelper
  include Pundit::Authorization
end
