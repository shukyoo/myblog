class Admin::ArticleController < Admin::BaseController
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 30)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create

  end
end
