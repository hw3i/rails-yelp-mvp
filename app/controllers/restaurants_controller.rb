class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].nil? || params[:search].empty?
      @restaurants = Restaurant.all
    else
      @restaurants = Restaurant.where(name: params[:search])
    end
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # Create restaurant
    @restaurant = Restaurant.new(restaurant_params)
    # redirect to the index of restaurants
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
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
