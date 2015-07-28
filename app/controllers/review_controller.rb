class ReviewController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user
    unless @review.save
      flash[:error] = t(:fill_review)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = t(:deleted_review)
    end
    redirect_to request.referrer || root_url
  end

  private
  def ingredient_params
    params.require(:review).permit(:review, :stars)
  end
end
