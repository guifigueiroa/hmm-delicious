require 'test_helper'

class HmmTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @recipe = recipes(:one)
  end

  test "should have user and recipe" do
    @hmm = Hmm.new
    assert_not @hmm.save
    @hmm.recipe = @recipe
    assert_not @hmm.save
    @hmm.user = @user
    assert @hmm.save
  end

  test "user should not like his own recipe" do
    @recipe.user = @user
    assert_not @recipe.hmm_by @user
  end

  test "user should not like recipe twice" do
    assert @recipe.hmm_by @other_user
    assert_not @recipe.hmm_by @other_user
  end
end
