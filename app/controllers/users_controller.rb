class UsersController < ApplicationController
  before_action :set_and_authorize_user, only: [:show, :update]

  def index
    authorize User
    @pagy, @users = pagy(find_users)
  end

  def show
  end

  def new
    authorize User
    @form = Users::Form.new(User.new, params)
  end

  def create
    authorize User
    @form = Users::Form.new(User.new, params)

    if @form.save
      redirect_to @form.object
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(update_user_params)
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_and_authorize_user
    @user = users_scope.find_by!(github_id: params[:id])
    authorize @user
  end

  def users_scope
    policy_scope(User)
  end

  def find_users
    users = users_scope.eager_load(:memberships).nicknames_alphabetically
    users = users.search(params[:search_query]) if params[:search_query].present?
    users
  end

  def update_user_params
    params.require(:admin_user).permit(:role)
  end
end
