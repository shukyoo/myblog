class Admin::ArticlesController < Admin::BaseController
  skip_before_filter :verify_authenticity_token, :only => :upload

  def index
    @articles = Article.resent.paginate(:page => params[:page], :per_page => 30)
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

  def upload
    # my_file = File.open("/tmp/test.png")
    uploader = ArticleUploader.new
    uploader.store!(my_file)
    render json: {error: 1, message: "test"}
  end

  def article_params
    params.require(:article).permit(:title, :category_id, :content)
  end
end
