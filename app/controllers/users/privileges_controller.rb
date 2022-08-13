class Users::PrivilegesController < ApplicationController
  def update
    @user = User.find_by!(github_id: params[:user_id])
    authorize @user, :update_privilege?

    @user.update(user_privilege_params)
    redirect_to user_path(@user)
  end

  private

  def user_privilege_params
    params.require(:user).permit(:privilege)
  end
end
