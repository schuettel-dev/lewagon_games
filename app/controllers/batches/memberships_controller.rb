class Batches::MembershipsController < ApplicationController
  before_action :set_batch, only: [:new, :create, :destroy, :update]

  def new
  end

  def create
    @user = User.find_by(id: params[:user_id])

    if @batch.memberships.find_or_create_by(user: @user)
      @batch.reload
      respond_to do |format|
        format.turbo_stream { render :update_all }
        format.html { redirect_to [:admin, @batch] }
      end
    else
      render :new
    end
  end

  def update
    @membership = @batch.memberships.find(params[:id])
    @membership.update!(role: params[:batch_membership][:role])

    respond_to do |format|
      format.turbo_stream { render :update }
      format.html { redirect_to batch_path(@batch) }
    end
  end

  def destroy
    membership = @batch.memberships.find(params[:id])
    @user = membership.user
    membership.destroy

    respond_to do |format|
      @batch.reload
      format.turbo_stream { render :update_all }
      format.html { redirect_to @batch }
    end
  end

  private

  def set_batch
    @batch = Batch.eager_load(:users).find_by!(url_identifier: params[:batch_id])
  end
end
