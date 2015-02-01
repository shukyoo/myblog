# -*- coding: utf-8 -*-
class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.articles.count > 0
      redirect_to admin_categories_path, alert: "此分类下还有文章，不能删除"
    else
      @category.destroy
      redirect_to admin_categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
