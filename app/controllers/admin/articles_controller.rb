class Admin::ArticlesController < Admin::BaseController
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
    @article = Article.new(article_params)
    @article.save
    redirect_to admin_articles_path
    # render plain: params[:article].inspect
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admin_articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
