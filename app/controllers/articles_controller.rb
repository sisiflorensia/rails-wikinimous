class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :mark_complete, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    # raise
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:article).permit(:title, :content)
  end
end
