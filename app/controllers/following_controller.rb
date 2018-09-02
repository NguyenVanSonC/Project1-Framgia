class FollowingController < ApplicationController
  def index
    @products = current_user.following_product.all
  end

  def create
    @id = params[:following][:followed_id]
    @product = Product.find_by id: @id
    if @product
      @following = Following.new following_params
      respond_to do |format|
        if @following.save
          format.js{render :toggle}
        else
          format.html{redirect_to product_path(@id)}
          format.js{render json: @following.errors, status: :unprocessable_entity}
        end
      end
    else
      flash[:danger] = t "products.product_not_found"
      redirect_to root_path
    end
  end

  def destroy
    @id = params[:id]
    @product = Product.find_by id: @id
    if @product
      @following = Following.find_by followed_id: params[:id],
      follower_id: current_user.id
      if current_user
        @following.destroy
        respond_to do |format|
          format.js{render :toggle}
        end
      end
    else
      flash[:danger] = t "products.product_not_found"
      redirect_to root_path
    end
  end

  private

  def following_params
    params.require(:following).permit :follower_id, :followed_id
  end
end
