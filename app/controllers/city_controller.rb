class CityController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
    @cities = City.sorted
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @city = City.find(params[:city_id])
  end

  def update
    @city = City.find(params[:city_id])
    if @city.update_attributes(city_params)
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @city = City.find(params[:city_id])
  end

  def destroy
    City.find(params[:city_id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def city_params
    params.require(:city).permit(:city_name)
  end

end
