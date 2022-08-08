class Admin::Users::MembershipsController < ApplicationController
  before_action :set_user, only: [:new, :create, :destroy]

  def new
  end

  def create
    batch = Batch.find(params[:batch_id])

    if @user.memberships.find_or_create_by(batch:)
      redirect_to [:admin, @user]
    else
      render :new
    end
  end

  def destroy
    membership = @user.memberships.find(params[:id])
    membership.destroy

    redirect_to [:admin, @user]
  end

  private

  def set_user
    @user = User.find_by!(github_id: params[:user_id])
  end
end
