class RestaurantsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # Create restaurant
    Restaurant.create(restaurant_params)
    # redirect to the index of restaurants
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # Filtering/Whitelisting the params that come in from the form
    params.require(:restaurant).permit(:name, :address, :category, :rating)
  end

end
