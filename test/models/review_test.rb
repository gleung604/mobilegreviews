require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @review = Review.new(title: "title", body: "body",
                         user: users(:john), score: 10)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "score should be present" do
    @review.score = nil
    assert_not @review.valid?
  end

  test "score should be between 0 and 10" do
    @review.score = -1
    assert_not @review.valid?
    @review.score = 11
    assert_not @review.valid?

    # Edge cases
    @review.score = 0
    assert @review.valid?
    @review.score = 10
    assert @review.valid?
  end
end
