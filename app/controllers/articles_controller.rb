# -*- coding: utf-8 -*-
class ArticlesController < ApplicationController

  before_action :fetch_categories

  def fetch_categories
    @categories = Category.order('position asc').all    
  end
  
  def index
    @articles = Article.resent.paginate(:page => params[:page], :per_page => 12)
  end

  def category
    @category = Category.find(params[:id])
    if @category
      @articles = Article.resent.where(category_id: @category.id).paginate(:page => params[:page], :per_page => 12)
      render 'articles/index'
    else
      redirect_to root_path, alert: '分类不存在'
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
