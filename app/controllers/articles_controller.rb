class ArticlesController < ApplicationController
  def index
    @articles = Articles.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @article = Article.find(params[:id])
  end
end
