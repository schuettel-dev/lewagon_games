class Admin::Batches::MembersController < ApplicationController
  def new
    @batch = Batch.find_by!(url_identifier: params[:batch_id])
  end
end
