class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new

  end

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @ingredient = recipe.ingredients.build
    @prep_step = recipe.prep_steps.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = t(:recipe_saved)
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update

  end

  def myrecipes
    @recipes = Recipe.where(user: current_user)
  end

  def hmm
    unless recipe.hmm_by(current_user)
      flash[:danger] = recipe.errors.full_messages.last
    end

    redirect_to request.referrer || root_url
  end

  def destroy
    recipe.destroy
    redirect_to request.referrer || root_url
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :image)
  end
end
