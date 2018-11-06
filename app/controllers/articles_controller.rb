class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def create
    Article.create(article_params)
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit
    find_article
  end

  def update
    article = find_article
    article.update(article_params)
    redirect_to article_path
  end

  def destroy
    article = find_article
    article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
