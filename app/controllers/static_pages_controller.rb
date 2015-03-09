class StaticPagesController < ApplicationController

  def home
    @articles = Article.all

    if Tag.where(name: "featured").any?
      if Tag.where(name: "featured").first.articles.any?
        @featured = Tag.where(name: "featured").first.articles.last
      end
    end
  end

  def about
  end

  def contact
  end
end
