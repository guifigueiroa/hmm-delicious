require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = recipes(:one)
  end

  test "name should be present" do
    @recipe.name = "  "
    assert_not @recipe.valid?
  end
end
