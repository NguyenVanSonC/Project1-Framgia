module SessionsHelper
  def login user
    session[:user_id] = user.id
  end

  def logout
    forget current_user
    session.delete :user_id
    session.delete :cart
    session.delete :size
    @current_user = nil
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user&.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user? user
    user == current_user
  end

  def current_shipper?
    true if current_user&.shipper
  end

  def current_shipper
    current_user.shipper
  end

  def is_admin?
    return if current_user&.admin?
    redirect_to root_path
  end
end
