module CartsHelper
  def set_cart
    session[:cart] ||= {}
    session[:size] ||= {}
  end

  def count_cart
    set_cart
    session[:cart].count
  end
  
  def check_cart_empty
    return unless session[:cart].empty?
    redirect_to root_path
    flash[:danger] = t "cart_empty"
  end
end
