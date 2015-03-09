class ArticlesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search]
      @articles = Article.search(params[:search])
    else
      if params[:type]
        @articles = Review.all.order(score: :desc)
      else
        @articles = Article.all.order(updated_at: :desc)
      end
    end
  end

  def new
    if params[:type]
      @article = Review.new
    else
      @article = Article.new
    end
  end

  def create
    if params[:type]
      @article = Review.new(review_params)
    else
      @article = Article.new(article_params)
    end
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
    if @article.type && @article.update_attributes(review_params)
      flash[:success] = "Article updated"
      redirect_to @article
    elsif @article.update_attributes(article_params)
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

    def review_params
      params.require(:review).permit(:title, :body, :picture, :all_tags, :score)
    end

    # Confirms the correct user.
    def admin_user
      unless logged_in? && current_user.admin?
        redirect_to root_url
      end
    end
end
