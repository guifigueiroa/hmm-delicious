class RecipesController < ApplicationController
  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new

  end

  def index
    @recipes = Recipe.all
  end

  def show
    @ingredient = recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "Receita salva com sucesso"
      redirect_to @recipe
    else
      flash[:error] = "Erro ao salvar receita"
      render 'new'
    end
  end

  def update

  end

  def destroy
    recipe.destroy
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :description, :cooking_time)
    end
end
