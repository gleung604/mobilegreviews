require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
  	@article = Article.new(title: "title", body: "body", user: users(:john))
  end

  test "should be valid" do
    assert @article.valid? 	
  end

  test "title should be present" do
  	@article.title = ""
  	assert_not @article.valid?
  end

  test "body should be present" do
    @article.body = ""
    assert_not @article.valid?
  end

  test "user should be present" do
    @article.user = nil
    assert_not @article.valid?
  end
end
