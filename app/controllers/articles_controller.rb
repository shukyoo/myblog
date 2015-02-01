# -*- coding: utf-8 -*-
class ArticlesController < ApplicationController

  def index
    @articles = Article.resent.paginate(:page => params[:page], :per_page => 12)
    @categories = Category.all
  end

  def category
    @category = Category.find(params[:id])
    if @category
      @articles = Article.resent.where(category_id: @category.id).paginate(:page => params[:page], :per_page => 12)
      @categories = Category.all
      render 'articles/index'
    else
      redirect_to root_path, alert: '分类不存在'
    end
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
