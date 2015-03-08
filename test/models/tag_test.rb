require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  def setup
    @tag = tags(:news)
  end

  test "should be valid" do
    assert @tag.valid?
  end

  test "name should be present" do
    @tag.name = ""
    assert_not @tag.valid?
  end

  test "name should be alphanumeric" do
    @tag.name = "two words"
    assert_not @tag.valid?
    @tag.name = "!@#%^&*()"
    assert_not @tag.valid?
  end
end
