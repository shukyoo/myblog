# -*- coding: utf-8 -*-
class Admin::ArticlesController < Admin::BaseController
  skip_before_filter :verify_authenticity_token, :only => :upload_image

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

  def upload_image
    image = Attachment.new({:file => params[:imgFile]})
    has_one = Attachment.where(:file => image.file.filename).first
    if has_one.present?
      path = has_one.file.url
    else
      image.save
      path = image.file.url
    end

    if path
      render json: {error: 0, url: path}
    else
      render json: {error: 1, message: "upload error"}
    end
  end

  def article_params
    params.require(:article).permit(:title, :category_id, :content, :summary_length)
  end
end
