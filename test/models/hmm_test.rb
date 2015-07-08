require 'test_helper'

class HmmTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
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
end
