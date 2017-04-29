class RestaurantController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
    @restaurants = Restaurant.sorted
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    Restaurant.find(params[:restaurant_id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name)
  end

end
