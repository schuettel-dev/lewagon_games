class SessionsController < ApplicationController
  prepend_before_action :redirect_to_root_if_signed_in
  skip_before_action :authenticate_user!

  def new; end

  private

  def redirect_to_root_if_signed_in
    return redirect_to root_path if signed_in?
  end
end
