class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    if(!@ingredient.save)
      flash[:error] = "Por favor, preencha o ingrediente"
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    ingredient.destroy
    flash[:success] = "Ingrediente excluído"
    redirect_to request.referrer || root_url
  end

  def ingredient
    ingredient ||= Ingredient.find(params[:id])
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:ingredient)
  end
end
