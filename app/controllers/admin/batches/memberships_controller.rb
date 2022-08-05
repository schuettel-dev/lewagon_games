class Admin::Batches::MembershipsController < ApplicationController
  before_action :set_batch, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(id: params[:user_id])

    if @batch.memberships.find_or_create_by(user: user)
      redirect_to [:admin, @batch]
    else
      render :new
    end
  end

  def destroy
    membership = @batch.memberships.find(params[:id])
    membership.destroy

    redirect_to [:admin, @batch]
  end

  private

  def set_batch
    @batch = Batch.find_by!(url_identifier: params[:batch_id])
  end
end
