class MembershipsController < ApplicationController
  def update
    @membership = policy_scope(Membership).find(params[:id])
    @redirect_url = batch_membership_params[:redirect_url]
    authorize @membership

    @membership.update!(batch_membership_params.except(:redirect_url))

    respond_to do |format|
      format.turbo_stream { render :update_role }
      format.html { redirect_to @redirect_url }
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    @object = params[:redirect_to_user].present? ? membership.user : membership.batch
    membership.destroy

    respond_to do |format|
      format.turbo_stream do
        if @object.is_a?(User)
          render :update_user
        else
          render :update_batch
        end
      end
      format.html { redirect_to @object }
    end
  end

  private

  def batch_membership_params
    params.require(:batch_membership).permit(:role, :redirect_url)
  end
end
