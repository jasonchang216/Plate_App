class RestaurantController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
    @restaurants = Restaurant.sorted
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order('created_at DESC')
    else
      @restaurants = Restaurant.all.order('created_at DESC')
    end
  end

  def restaurantlist
    @restaurants = Restaurant.sorted
  end

  def city_restaurant_list
    @city = City.find(params[:city_id])
    @restaurants = @city.restaurants.sorted
  end

  def new
    @restaurant = Restaurant.new
    @city = City.find(params[:city_id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to(:controller => 'city', :action => 'index')
      flash[:notice] = "Restaurant added!"
    else
      render('new')
      flash[:notice] = "Uh-oh something went wrong..."
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to(:action => 'index')
      flash[:notice] = "Restaurant updated!"
    else
      render('edit')
      flash[:notice] = "Uh-oh something went wrong..."
    end
  end

  def delete
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    Restaurant.find(params[:restaurant_id]).destroy
    redirect_to(:action => 'index')
    flash[:notice] = "Restaurant deleted!"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :city_id, :neighborhood)
  end

end
