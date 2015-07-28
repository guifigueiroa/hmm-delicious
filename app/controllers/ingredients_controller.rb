class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def ingredient
    ingredient ||= Ingredient.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    unless @ingredient.save
      flash[:error] = t(:fill_ingredient)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    if ingredient.destroy
      flash[:success] = t(:deleted_ingredient)
    end
    redirect_to request.referrer || root_url
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient)
  end
end
