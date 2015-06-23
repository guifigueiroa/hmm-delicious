class PrepStepsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @prep_step = @recipe.prep_steps.build(prep_step_params)
    @prep_step.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
  end

  private
    def prep_step_params
      params.require(:prep_step).permit(:description)
    end
end
