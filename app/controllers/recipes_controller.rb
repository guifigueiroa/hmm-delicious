class RecipesController < ApplicationController
  def new
  	@recipe = Recipe.new
  end

  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	if @recipe.save
  		flash[:success] = "Receita salva com sucesso"
  		redirect_to recipes_path
  	else
  		flash[:error] = "Erro ao salvar receita"
  		render 'new'
  	end
  end

  def destroy
  	@recipe = Recipe.find(params[:id])
  	@recipe.destroy
  end

  private
  	def recipe_params
  		params.require(:recipe).permit(:name, :description, :cooking_time)
  	end
end
