class Admin::UsersController < ApplicationController
  def index
    @pagy, @users = pagy(find_users)
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

  private

  def find_users
    users = User.eager_load(:memberships).nicknames_alphabetically
    users = users.search(params[:search_query]) if params[:search_query].present?
    users
  end
end
