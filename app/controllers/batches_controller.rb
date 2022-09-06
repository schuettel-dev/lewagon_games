class BatchesController < ApplicationController
  before_action :set_and_authorize_batch, only: [:show, :edit, :update]

  def index
    authorize Batch
    @pagy, @batches = pagy(find_batches)
  end

  def show; end

  def new
    @form = Batches::Form.new(Batch.new)
  end

  def create
    @form = Batches::Form.new(Batch.new, params, current_user)

    if @form.save
      redirect_to @form.object
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form = Batches::Form.new(@batch)
  end

  def update
    @form = Batches::Form.new(@batch, params)

    if @form.save
      redirect_to @form.object
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_and_authorize_batch
    @batch = policy_scope(Batch).find_by!(url_identifier: params[:id])
    authorize @batch
  end

  def find_batches
    batches = policy_scope(Batch).eager_load(:memberships).ordered_by_name
    batches = batches.search(params[:search_query]) if params[:search_query].present?
    batches
  end
end
