class GamesController < ApplicationController
  def index
    authorize Game
    @games = policy_scope(Game).ordered
  end

  def new
    @form = Games::Form.new(Game.new, params, current_user:)
    authorize @form
  end

  def create
    @form = Games::Form.new(Game.new, params, current_user:)
    authorize @form

    if @form.save
      redirect_to @form.object
    else
      puts "ERRORS #{@form.errors.to_a}"
      render :new, status: :unprocessable_entity
    end
  end
end
