class Admin::UsersController < ApplicationController
  def index
    @users = User.nicknames_alphabetically
  end

  def show
    @user = User.find_by!(github_id: params[:id])
  end

  def new
    @form = Admin::AddGithubUserForm.new(User.new, params)
  end

  def create
    @form = Admin::AddGithubUserForm.new(User.new, params)

    if @form.save
      redirect_to [:admin, @form.object]
    else
      render :new, status: :unprocessable_entity
    end
  end
end
