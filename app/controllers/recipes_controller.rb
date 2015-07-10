class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    @prep_step = recipe.prep_steps.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = t(:recipe_saved)
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update

  end

  def hmm
    @hmm = recipe.hmms.new
    @hmm.user = current_user
    @hmm.save
    redirect_to recipes_path
  end

  def destroy
    recipe.destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :image)
  end
end
