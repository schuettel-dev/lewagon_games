class Admin::BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  def index
    @batches = Batch.names_alphabetically
  end

  def show; end

  def new
    @form = Batches::Form.new(Batch.new)
  end

  def create
    @form = Batches::Form.new(Batch.new, params, current_user)

    if @form.save
      redirect_to [:admin, @form.object]
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
      redirect_to [:admin, @form.object]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_batch
    @batch = Batch.find_by!(url_identifier: params[:id])
  end
end
