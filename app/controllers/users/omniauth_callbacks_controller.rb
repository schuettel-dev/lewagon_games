class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :github

  def github
    @user = User.find_by_github_uid(request.env["omniauth.auth"].uid) # rubocop:disable Rails/DynamicFindBy

    return handle_user_present if @user.present?

    # Removing :extra as it can overflow some session stores
    session["devise.github_data"] = request.env["omniauth.auth"].except(:extra)
    redirect_to new_user_registration_url
  end

  def failure
    redirect_to root_path
  end

  private

  def handle_user_present
    sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
    set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
  end
end
