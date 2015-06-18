class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    @ingredient.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:ingredient)
    end
end
