class PrepStepsController < ApplicationController
  before_action :authenticate_user!

  def prep_step
    prep_step ||= PrepStep.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @prep_step = @recipe.prep_steps.build(prep_step_params)
    unless @prep_step.save
      flash[:error] = t(:fill_prep_step)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    if prep_step.destroy
      flash[:success] = t(:deleted_prep_step)
    end
    redirect_to request.referrer || root_url
  end

  private
  def prep_step_params
   params.require(:prep_step).permit(:description)
  end
end
