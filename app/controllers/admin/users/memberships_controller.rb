class Admin::Users::MembershipsController < ApplicationController
  before_action :set_user, only: [:new, :create, :destroy]

  def new
  end

  def create
    @batch = Batch.find(params[:batch_id])

    if @user.memberships.find_or_create_by(batch: @batch)
      respond_to do |format|
        format.turbo_stream { render :update }
        format.html { redirect_to [:admin, @user] }
      end
    else
      render :new
    end
  end

  def destroy
    membership = @user.memberships.find(params[:id])
    @batch = membership.batch
    membership.destroy

    respond_to do |format|
      format.turbo_stream { render :update }
      format.html { redirect_to [:admin, @user] }
    end
  end

  private

  def set_user
    @user = User.find_by!(github_id: params[:user_id])
  end
end
