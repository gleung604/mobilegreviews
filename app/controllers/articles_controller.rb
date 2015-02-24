class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :picture)
    end
end
