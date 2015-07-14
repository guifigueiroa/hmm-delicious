class PrepStepsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @prep_step = @recipe.prep_steps.build(prep_step_params)
    unless @prep_step.save
      flash[:error] = t(:fill_prep_step)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
  end

  private
  def prep_step_params
   params.require(:prep_step).permit(:description)
  end
end
