class Admin::BaseController < ApplicationController
  layout "admin"
  # before_filter :is_admin?
end

class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: %i(destroy)

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = "user not found"
  end
end
