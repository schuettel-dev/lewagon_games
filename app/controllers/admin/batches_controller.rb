class Admin::BatchesController < ApplicationController
  def index
    @batches = Batch.names_alphabetically
  end
end
