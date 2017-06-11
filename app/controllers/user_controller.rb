class UserController < ApplicationController

  layout 'application'

  before_action :confirm_logged_in, :except =>[:new, :create]

  def index
    @users = User.sorted
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(:controller => 'access', :action => 'login')
    else
      flash[:notice] = "Invalid sign up."
      render('new')
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      redirect_to(:action=> 'index')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:user_id])
  end

  def destroy
    User.find(params[:user_id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
