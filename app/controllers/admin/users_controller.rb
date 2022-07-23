class Admin::UsersController < ApplicationController
  def index
    @users = User.nicknames_alphabetically
  end

  def new
    @form = Users::NewForm.new(User.new, params)
  end

  def create; end
end
