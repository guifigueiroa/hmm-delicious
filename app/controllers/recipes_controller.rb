class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
    end

    flash[:info] = t(:no_recipes_to_show) if @recipes.empty?
  end

  def show
    @ingredient = Ingredient.new
    @prep_step = PrepStep.new
    @review = Review.new
    recipe
  end

  def new
    @recipe = Recipe.new
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

  def update; end

  def myrecipes
    @recipes = Recipe.where(user: current_user)

    flash[:info] = t(:no_recipes_created) if @recipes.empty?
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
    params.require(:recipe).permit(:name, :description, :cooking_time, :image, :search)
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end
end
