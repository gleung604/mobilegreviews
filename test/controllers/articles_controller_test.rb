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
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @article
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @article, article: { title: "Test",
                                            body: "Lorem ipsum",
                                            user: users(:john) }
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete :destroy, id: @article
    end
    assert_redirected_to root_url
  end

  test "should redirect create when not admin" do
    log_in_as(users(:notadmin))
    assert_no_difference 'Article.count' do
      post :create, article: { title: "Test",
                               body: "Lorem ipsum",
                               user: users(:john) }
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when not admin" do
    log_in_as(users(:notadmin))
    get :edit, id: @article
    assert_redirected_to root_url
  end

  test "should redirect update when not admin" do
    log_in_as(users(:notadmin))
    patch :update, id: @article, article: { title: "Test",
                                            body: "Lorem ipsum",
                                            user: users(:john) }
    assert_redirected_to root_url
  end

  test "should redirect destroy when not admin" do
    log_in_as(users(:notadmin))
    assert_no_difference 'Article.count' do
      delete :destroy, id: @article
    end
    assert_redirected_to root_url
  end
end
