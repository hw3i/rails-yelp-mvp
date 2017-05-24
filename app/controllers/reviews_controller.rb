class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find([params[:restaurant_id]])
    @review.save
  end

  private

  def review_params
    # Filtering/Whitelisting the params that come in from the form
    params.require(:review).permit(:content, :rating)
  end
end
