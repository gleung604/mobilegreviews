class StaticPagesController < ApplicationController

  def home
    @articles = Article.all
  end

  def about
  end

  def contact
  end
end
