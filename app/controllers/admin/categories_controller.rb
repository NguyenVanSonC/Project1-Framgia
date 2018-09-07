class Admin::BaseController < ApplicationController
  layout "admin"
  # before_filter :is_admin?
end

class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: %i(edit update destroy)

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Create success"
      redirect_to admin_categories_path
    else
      flash[:error] = "Create error"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Update success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Deleted"
    redirect_to admin_categories_path
  end

  private

  def find_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = "category not found"
  end

  def category_params
    params.require(:category).permit :name, :child_of, :description
  end
end
