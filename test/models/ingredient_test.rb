require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @recipe = recipes(:one)
  end

  test "ingredient should be present" do
    @ingredient = @recipe.ingredients.new
    @ingredient.ingredient = ' '
    assert_not @ingredient.save
  end
end
