class MembershipsController < ApplicationController
  def update
    @membership = policy_scope(BatchMembership).find(params[:id])
    @redirect_url = batch_membership_params[:redirect_url]
    authorize @membership

    @membership.update!(batch_membership_params.except(:redirect_url))

    respond_to do |format|
      format.turbo_stream { render :update }
      format.html { redirect_to @redirect_url }
    end
  end

  private

  def batch_membership_params
    params.require(:batch_membership).permit(:role, :redirect_url)
  end
end
