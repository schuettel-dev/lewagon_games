class Admin::BatchesController < ApplicationController
  def index
    @batches = Batch.names_alphabetically
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @form = Batches::Form.new(Batch.new)
  end

  def create
    @form = Batches::Form.new(Batch.new, params)

    if @form.save
      redirect_to [:admin, @form.object]
    else
      render :new, status: :unprocessable_entity
    end
  end
end
