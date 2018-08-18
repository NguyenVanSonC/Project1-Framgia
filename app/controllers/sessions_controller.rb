class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user &. authenticate(params[:session][:password])
      login user
      if params[:session][:remember_me] == 1
        remember user
      else
        forget user
      end
      flash[:success] = t "success_login"
      redirect_to root_path
    else
      flash[:warning] = t "warning_login"
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
end
