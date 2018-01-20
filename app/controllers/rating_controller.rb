class RatingController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in

  def index
    @ratings = Rating.sorted
  end

  def restaurant_rating_list
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ratings = @restaurant.ratings.sorted
  end

  def user_rating_list
    @user = User.find(params[:user_id])
    @ratings = @user.ratings.sorted
  end

  def new
    @rating = Rating.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to(:controller => 'landing', :action => 'index')
      flash[:notice] = "Your rating has been added!"
    else
      render('new')
      flash[:notice] = "Uh-oh something went wrong..."
    end
  end

  def edit
    @rating = Rating.find(params[:rating_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @rating = Rating.find(params[:rating_id])
    if @rating.update_attributes(rating_params)
      redirect_to(:action => 'index')
      flash[:notice] = "Your rating has been updated!"
    else
      render('edit')
      flash[:notice] = "Uh-oh something went wrong..."
    end
  end

  def delete
    @rating = Rating.find(params[:rating_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    Rating.find(params[:rating_id]).destroy
    redirect_to(:action => 'index')
  end

private

  def rating_params
    params.require(:rating).permit(:id, :restaurant_rating, :date_rated, :restaurant_comment, :user_id, :restaurant_id)
  end

end
