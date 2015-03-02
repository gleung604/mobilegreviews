class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Article updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article deleted"
    redirect_to articles_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :picture, :all_tags)
    end

    # Confirms the correct user.
    def correct_user
      @article = Article.find(params[:id])
      redirect_to(root_url) unless current_user?(@article.user)
    end
end
