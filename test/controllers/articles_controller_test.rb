require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @article = articles(:monster_hunter)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post :create, article: { title: "Test",
                               body: "Lorem ipsum",
                               user: users(:john) }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete :destroy, id: @article
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong article" do
    log_in_as(users(:asher))
    assert_no_difference 'Article.count' do
      delete :destroy, id: @article
    end
    assert_redirected_to root_url
  end
end
