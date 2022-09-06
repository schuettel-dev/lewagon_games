class Batches::MembershipsController < ApplicationController
  before_action :set_batch, only: [:new, :create]

  def new
    authorize @batch, :new?
  end

  def create
    @user = User.find_by(id: params[:user_id])

    if @batch.memberships.find_or_create_by(user: @user)
      @batch.reload
      respond_to do |format|
        format.turbo_stream { render :update }
        format.html { redirect_to [:admin, @batch] }
      end
    else
      render :new
    end
  end

  private

  def set_batch
    @batch = Batch.eager_load(:users).find_by!(url_identifier: params[:batch_id])
  end
end
